return {
    "neovim/nvim-lspconfig",
    config = function() 
         local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('<leader>ld', require('telescope.builtin').lsp_definitions, 'Goto Definition')

          -- Find references for the word under your cursor.
          map("<leader>lr", require('telescope.builtin').lsp_references, 'Goto References')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('<leader>li', require('telescope.builtin').lsp_implementations, 'Goto Implementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>lt', require('telescope.builtin').lsp_type_definitions, 'Goto Type Definition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>wS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>lR', vim.lsp.buf.rename, "Rename")

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>la', vim.lsp.buf.code_action, "Code Action")

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap.
          map('<leader>lK', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('<leader>lD', vim.lsp.buf.declaration, "Goto Definition")

              local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    end
}
