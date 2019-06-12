function printMat(mat)
sz = size(mat);
for i=1:sz(1)
	for j=1:sz(2)
		if j<sz(2)
			localPrint(mat(i,j));
			fprintf("&")
		else
			if i<sz(1)
				localPrint(mat(i,j));
				fprintf("@");
			else
				localPrint(mat(i,j));
				fprintf("\n");
			end
		end
	end
end
end

function localPrint(num)
if real(num)==num
	fprintf("%.3g",num)
else
	fprintf("%.3g%+.3gj",real(num),imag(num))
end
end