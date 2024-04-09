function pyvenv -d "Activate Python Virtual Environment"
	set -l venv_dir $argv[1]

	if test -z "$venv_dir"
		echo "Activate Python Virtual Environment"
		echo "usage: pyvenv <venv_dir>"
		return
	end

	if not test -d "./$venv_dir"
		echo "pyvenv: '$venv_dir' can not be found"
		return
	end

	if not test -e "./$venv_dir/bin/activate"
		echo "pyvenv: '$venv_dir' is not a valid Virtual Environment"
		return
	end

	source $(pwd)/$venv_dir/bin/activate.fish
end
