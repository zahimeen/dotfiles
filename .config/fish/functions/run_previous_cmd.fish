function run_previous_cmd -d "Run The Previous Command"
    eval command $history[$argv[1]]
end
