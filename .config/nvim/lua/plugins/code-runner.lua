require('code_runner').setup({
  -- mode
  mode = "toggleterm",
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "cd $dir && python3 $fileName",
		typescript = "cd $dir && ts-node $fileName",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
	},
})
