local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local git_repo = "https://github.com/wbthomason/packer.nvim"

fn.system({ "rm", "-rf", fn.stdpath("data") })
fn.system({ "git", "clone", "--depth", "1", git_repo, install_path })
