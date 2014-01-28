function h(k::Uint64)
        div(typemax(Uint32),k + (k==0))*k
end

function mod0(x::Uint64, k::Uint64)
        x % (k + (k==0)) + x*(k==0)
end

function mod02(x::Uint64, k::Uint64)
        k == 0 ? x : x % k
end


f1(k::Uint64) = k > 0 ? div(typemax(Uint32),k)*k : k
f2(k) = div(typemax(Uint32),k)*k

function ff(k)
	n = 0
	local k2
	while k > 0
		n += 1
		k2 = k
		k >>= 32
	end
	(n, div(typemax(Uint32),k2)*k2)
end


begin
	local a1 = uint64(10000)
	local a2 = uint64(10000000000)

	h(a2); f1(a2); f2(a2); ff(a2); mod02(a1,a2); mod0(a1,a2)

 @time for i in 1:1000000; f1(a2); end
 @time for i in 1:1000000; f2(a2); end
 @time for i in 1:1000000; h(a2); end
 @time for i in 1:1000000; mod0(a1,a2); end
 @time for i in 1:1000000; mod02(a1,a2); end
 @time for i in 1:1000000; ff(a2); end
end


