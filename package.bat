@echo off

:: 创建打包目录
if not exist "dist" mkdir "dist"

:: 复制文件到打包目录
xcopy "backend" "dist\backend" /E /I /Y
xcopy "data" "dist\data" /E /I /Y
xcopy "frontend" "dist\frontend" /E /I /Y
xcopy "图片" "dist\图片" /E /I /Y

:: 压缩成ZIP文件
powershell -Command "Compress-Archive -Path 'dist\*' -DestinationPath '点单h5.zip' -Force"

:: 清理临时目录
rd /s /q "dist"

echo 打包完成！
echo 压缩文件：点单h5.zip
pause