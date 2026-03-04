#!/usr/bin/env python3
import socket
import threading

HOST = "0.0.0.0"
PORT = 8080


def handle_client(conn, addr):
    print(f"[+] Client connected: {addr}")

    try:
        while True:
            data = conn.recv(1024)
            if not data:
                break
            print(f"[{addr}] Received: {data.decode()}")

            response = f"Server ACK: {data.decode()}"
            conn.sendall(response.encode())
            print(f"[{addr}] Sent: {response}")
    except Exception as e:
        print(f"[!] Error: {e}")
    finally:
        conn.close()
        print(f"[-] Client disconnected: {addr}")


def main():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    try:
        server.bind((HOST, PORT))
        server.listen(5)
        print(f"[*] TCP Server listening on {HOST}:{PORT}")

        while True:
            conn, addr = server.accept()
            thread = threading.Thread(target=handle_client, args=(conn, addr))
            thread.daemon = True
            thread.start()
    except KeyboardInterrupt:
        print("\n[*] Server shutting down")
    finally:
        server.close()


if __name__ == "__main__":
    main()
