.code

; int MyNativeSub(int a, int b);

MyNativeSub     proc export

    sub     ecx, edx
    mov     eax, ecx
    ret

MyNativeSub endp

end

