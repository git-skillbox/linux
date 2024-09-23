import serial
import time

# Настройка последовательного соединения (проверьте правильный COM порт)
arduino = serial.Serial('COM3', 9600, timeout=1)  # Используйте соответствующий COM порт
time.sleep(2)  # Даем время для инициализации соединения

def set_motor_power(power):
    if 1000 <= power <= 2000:
        # Отправляем мощность на Arduino
        command = str(power) + '\n'
        arduino.write(command.encode())
        print(f"Мощность установлена на {power}")
    else:
        print("Недопустимое значение мощности, используйте диапазон 1000-2000")

try:
    while True:
        # Вводим мощность с клавиатуры
        power = int(input("Введите мощность двигателя (1000-2000): "))
        set_motor_power(power)
        time.sleep(1)  # Небольшая задержка

except KeyboardInterrupt:
    print("Программа завершена")
    arduino.close()

