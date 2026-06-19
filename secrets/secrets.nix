let
  local = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCS5cbiEvEi4zBeQ+zoQsf2FzUXGaqBmFaL+KM3XlR0/nXc+IEamo/JRxVKg/nqDIyuUJh5e/u+wuDWx++egLz48jmlD6HiupS3do3zJBm8lWRuocn9wixltC6rLl+9sUVLFt594xg5ZSP5bmyNy42VspI5EyOZd1Oda87far3idFU4wraQ3bbjMtrb8qbARfFCG1Y8yL3opeq5lJkxKK+F+89y1/IeFdQaBrA4y7YPVsUYKXY9VTjOQssbkkwU8HZznrzkhsE3uFKg4OZAuHd4Skgq2YVnILgj/4aTLQCLurIhsRYqkA2XPDkEQKgiqEfx5cU701fY2qUjbzQv2GCyq3526n6q4LJtK/BPj72cCI78zKNpk86tWY75fwtJzLajoxhAHLeFwSBoFcXiuB2GoU2G3X0mVmQCaUsSX3gnFGpLDL3uYBzc1nwtt7g7qyCBQX4BAabJY/UsW2sWlDFlA2e7q7gq4MMQt6uRqVMvbZxkh2sAZEmJBqqOSLqqGqk= miigha@laeppaeri";
  remote = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPaNtx2TTOABCUzXfXiMFB/l9hODwJ/pqheqaVkVN4kh root@laeppaeri";
in
{
  "user.age".publicKeys = [ local remote ];
  "root.age".publicKeys = [ local remote ];
}
