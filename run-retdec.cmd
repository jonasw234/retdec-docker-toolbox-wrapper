@echo off
set drive=/%~d1
for %%a in ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i"
            "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r"
            "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") do (
    call set drive=%%drive:%%~a%%
)
set folder=/%drive%%~p1
set folder=%folder::=%
set folder=%folder:\=/%
set filename=%~n1
set extension=%~x1
set restvar=
shift
:loop
if "%1"=="" goto after_loop
set restvar=%restvar% %1
shift
goto loop
:after_loop
docker run --rm -u root -v "%folder%":/destination retdec retdec-decompiler.py /destination/%filename%%extension% %restvar%
