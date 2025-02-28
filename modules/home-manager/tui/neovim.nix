{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];
  xdg.desktopEntries = {
    nvim = lib.mkForce {
      name = "Neovim";
      type = "Application";
      mimeType = [ "text/plain" ];

      icon = ../../../assets/icons/neovim.svg;
      exec = "${pkgs.kitty}/bin/kitty nvim";
    };
    notepad = {
      name = "Quick Notes (tmp)";
      exec = "${pkgs.kitty}/bin/kitty nvim tmp.txt";
      icon = "notepad";
    };
  };
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        globals = {
          instant_username = "ardishco";
        };
        keymaps = [
          {
            key = "<C-p>";
            mode = "n";
            silent = true;
            action = ":Telescope zoxide list<CR>";
          }
        ];
        visuals = {
          indent-blankline = {
            enable = true;
          };
        };
        tabline = {
          nvimBufferline = {
            enable = true;
          };
        };
        preventJunkFiles = true;
        options = {
          tabstop = 2;
          shiftwidth = 2;
        };
        lazy = {
          enable = true;
        };
        autocomplete = {
          nvim-cmp = {
            enable = true;
          };
        };
        autopairs = {
          nvim-autopairs = {
            enable = true;
          };
        };
        lsp = {
          enable = true;
          formatOnSave = true;
          lspconfig = {
            enable = true;
          };
          lsplines = {
            enable = true;
          };
          lspsaga = {
            enable = true;
          };
        };
        treesitter = {
          enable = true;
          indent = {
            enable = true;
          };
        };
        terminal = {
          toggleterm = {
            enable = true;
            setupOpts = {
              direction = "vertical";
              size = 80;
            };
          };
        };
        viAlias = true;
        vimAlias = true;
        lineNumberMode = "number";
        useSystemClipboard = true;
        theme = {
          enable = true;
          name = "catppuccin";
          style = "frappe";
        };
        spellcheck.enable = true;
        telescope = {
          enable = true;
          mappings = {
            findFiles = "<C-l>";
          };
        };
        languages = {
          bash = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          assembly = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          rust = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          nix = {
            enable = true;
            lsp.enable = true;
            extraDiagnostics.enable = true;
            format = {
              enable = true;
              type = "nixfmt";
            };
            treesitter.enable = true;
          };
          sql = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
          };
          clang = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
            dap.enable = true;

          };
          ts = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            treesitter.enable = true;
          };
          python = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            treesitter.enable = true;
          };
          markdown = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            treesitter.enable = true;
          };
          html = {
            enable = true;
            treesitter.enable = true;
          };
          go = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          lua = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          dart = {
            enable = true;
            treesitter.enable = true;
            lsp.enable = true;
            # flutter-tools.enable = true;
          };
          css = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
        };
        comments = {
          comment-nvim.enable = true;
        };
        dashboard = {
          alpha.enable = true;
        };
        pluginRC.alpha = lib.mkForce ''

          local alpha = require("alpha")
          local dashboard = require("alpha.themes.dashboard")

          dashboard.section.header.opts.hl = "AlphaHeader"

          -- Set menu
          dashboard.section.buttons.val = {
              dashboard.button( "n", "📄 New     ", ":ene <BAR> startinsert <CR>"),
              dashboard.button( "r", "🌺 Recent  ", ":Telescope oldfiles<CR>"),
              dashboard.button( "s", "🔎 Restore ", "<cmd>lua require('persistence').load({ last = true })<CR>"),
              dashboard.button( "p", "💼 Projects", ":Telescope projects<CR>"),
              dashboard.button( "q", "❌ Quit", "<cmd>exit<CR>"),
          }

          alpha.setup(dashboard.opts)

          -- Disable folding on alpha buffer
          vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
            ]])
        '';
        projects = {
          project-nvim.enable = true;
        };
        filetree = {
          nvimTree = {
            enable = true;
            openOnSetup = false;
            mappings.toggle = "<C-s>";
          };
        };
        statusline = {
          lualine.enable = true;
        };
        assistant = {
          copilot.enable = true;
        };
        extraPlugins = {
          slides-nvim = {
            package = pkgs.vimUtils.buildVimPlugin {
              name = "slides.nvim";
              src = pkgs.fetchFromGitHub {
                owner = "NotAShelf";
                repo = "slides.nvim";
                rev = "4c168fb47037dd49961f4aee163905774cc17980";
                hash = "sha256-He6loB5/b8/Y3qS/Zq5zDUaMQgyWmvl88r7qJi+v/6Y=";
              };
            };
            setup = "require('slides').setup {}";
          };
          rooter = {
            package = pkgs.vimPlugins.vim-rooter;
          };
          zoxide-telescope = {
            package = pkgs.vimPlugins.telescope-zoxide;
          };
          #      nixd = {
          #        package = inputs.nixd.packages.${pkgs.system}.nixd;
          #        setup = ''
          #          require("lspconfig").nixd.setup({
          #            cmd = { "${inputs.nixd.packages.${pkgs.system}.nixd}/bin/nixd" },
          #            # cmd = { "nixd" },
          #            settings = {
          #              nixd = {
          #                nixpkgs = {
          #                  expr = "(builtins.getFlake "/home/${username}/NixOS/OuterHeaven").nixosConfigurations.${hostname}.options",
          #                },
          #                formatting = {
          #                  command = { "nixfmt" }, -- or nixfmt or nixpkgs-fmt
          #                },
          #                options = {
          #                  nixos = {
          #                    expr = "(builtins.getFlake "/home/${username}/NixOS/OuterHeaven").nixosConfigurations.${hostname}.options",
          #                },
          #                home_manager = {
          #                     expr = "(builtins.getFlake "/home/${username}/NixOS/OuterHeaven").homeConfigurations.${hostname}.options",
          #                  },
          #                },
          #              },
          #            },
          #          })
          #        '';
          # after = ["telecope"];
          #      };
          # live-share = {
          #   package = pkgs.vimUtils.buildVimPlugin {
          #     name = "live-share.nvim";
          #     src = pkgs.fetchFromGitHub {
          #       owner = "azratul";
          #       repo = "live-share.nvim";
          #       rev = "main";
          #       sha256 = "sha256-HYe8WZu5SCIV1ypZ/MxdfDe9SBQ5nPBb3zrk7dMccxI=";
          #     };
          #   };
          #   setup = ''
          #     require('live-share').setup ({
          #                   port_internal = 9876,
          #                   max_attempts = 20,
          #                   service_url = "/tmp/service.url",
          #                   service = "nokey@localhost.run",
          #                 })
          #   '';
          #   after = [ "instant" ];
          # };
          # instant = {
          #   package = pkgs.vimUtils.buildVimPlugin {
          #     name = "instant.nvim";
          #     src = pkgs.fetchFromGitHub {
          #       owner = "jbyuki";
          #       repo = "instant.nvim";
          #       rev = "master";
          #       sha256 = "sha256-DXJWji/NR8ZCxe014rD51v3EHJHMhRQeOoI3SsY8mR4=";
          #     };
          #   };
          #   setup = ''require('instant').setup {}'';
          #   # before = "live-share.nvim";
          # };
        };
        extraPackages = with pkgs; [
          zoxide
        ];
      };
    };
  };
}
