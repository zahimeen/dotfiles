# stolen from distrotube
function extract -d "Extract Compressed Files & Folders"
	if test -z "$argv"
		echo "Extract Compressed Files & Folders"
		echo "usage: extract <path/file_name.ext>"
		return 1
	end

	for file in $argv
		if not test -f "$file"
			echo "extract: '$file' - file not found"
			return 1
		end
		
		switch $file
			case "*.cbt" "*.tar.bz2" "*.tar.gz" "*.tar.xz" "*.tbz2" "*.tgz" "*.txz" "*.tar"
				tar xvf "$file"
			case "*.lzma"
				unlzma "$file"
			case "*.bz2"
				bunzip2 "$file"
			case "*.cbr" "*.rar"
				unrar x -ad "$file"
			case "*.gz"
				gunzip "$file"
			case "*.cbz" "*.epub" "*.zip"
				unzip "$file"
			case "*.z"
				uncompress "$file"
			case "*.7z" "*.arj" "*.cab" "*.cb7" "*.chm" "*.deb" "*.dmg" "*.iso" "*.lzh" "*.msi" "*.pkg" "*.rpm" "*.udf" "*.wim" "*.xar"
				 7z x "$file"
			case "*.xz"
				unxz "$file"
			case "*.exe"
				cabextract "$file"
			case "*.cpio"
				cpio -id < "$file"
			case "*.cba" "*.ace"
				unace x "$file"
			case "*"
				echo "extract: '$file' - unknown compression method"
				return 1
		end

		echo "'$file' extracted successfully"
	end
end
