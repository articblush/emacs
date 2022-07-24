<h2 align="center"> Articblush Emacs </h2> 

## Installation

run this command

1. Clone repo `git clone https://github.com/articblush/articblush-emacs.git` in directory of your choosing.
2. Add the following code in your emacs config file:
   ```elisp
   (add-to-list 'custom-theme-load-path "~/.emacs.d/themes") ;;; Make a themes directory and add articblush-emacs to it

   (load-theme 'articblush t t)
   (enable-theme 'articblush)
   ```

## Credits

- Official fork from [Kborling](https://github.com/kborling)

