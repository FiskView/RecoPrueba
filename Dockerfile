# Usa una imagen base oficial de Python
FROM python:3.12-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos necesarios al contenedor
COPY requirements.txt requirements.txt
COPY . .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto en el que se ejecutará la aplicación Flask (por defecto 5000)
EXPOSE 5000

# Comando para ejecutar tu aplicación usando Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
