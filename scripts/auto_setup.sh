#!/bin/bash
# Set up su with password user knows
sudo passwd

# Go into sudo mode
su

# Remove all of the unneeded and unwanted programs
sudo dnf group remove gnome-desktop

# Upgrade all of the package
sudo dnf upgrade -y

# Install all of the required programs
sudo dnf install -y\\ 
vim\\ 
nvim\\ 
alacritty\\ 
mpv\\
feh\\
cmus\\
zathura\\ 
zathura-pdf-poppler\\ 
libreoffice-writer\\ 
libreoffice-calc\\
libreoffice-impress\\
libreoffice-draw\\
keepassxc\\
gnome-tweak-tool\\
gnome-extensions-app\\
gnome-shell-extnesion-background-logo\\
gnome-shell-extnesion-common\\
gnome-shell-extnesion-user-theme\\
gnome-snapshot\\
dconf-editor\\
java-11-openjdk\\
python3\\
rclone\\
clang\\
clang-tools-extra\\

# Set up Snap and the snap packages
sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install -y emacs --edge --classic
sudo snap install -y spotify

# Symlink all the important files
ln -s ~/Dotfiles/.config/git/ignore ~/.config/git
ln -s ~/Dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/Dotfiles/.config/zathura ~/.config/zathura
ln -s ~/Dotfiles/.ctags.d ~/.ctags.d
ln -s ~/Dotfiles/bash/.bashrc ~/.bashrc
sudo ln -s ~/Dotfiles/systemd_services/rclone.service /etc/systemd/system/rclone.service
sudo ln -s ~/Dotfiles/systemd_services/onedrivewsu.service /etc/systemd/system/onedrivewsu.service
ln -s ~/Dotfiles/.tmux.conf ~/.tmux.conf

# Start up the systemd services that we symlinked
sudo systemctl start rclone.service
sudo systemctl enable rclone.service
sudo systemctl start onedrivewsu.service
sudo systemctl enable onedrivewsu.service

# Set up dconf settings
cat ~/Dotfiles/dconf/dconf_settins-2021_09_12.ini | dconf load / 

#Install all of the required texlive packages
sudo dnf install -y\\
texlive.noarch                             \\
texlive-ae.noarch                          \\
texlive-algorithms.noarch                  \\
texlive-alphalph.noarch                    \\
texlive-amscls.noarch                      \\
texlive-amsfonts.noarch                    \\
texlive-amsmath.noarch                     \\
texlive-anysize.noarch                     \\
texlive-arabxetex.noarch                   \\
texlive-arphic.noarch                      \\
texlive-atbegshi.noarch                    \\
texlive-attachfile.noarch                  \\
texlive-attachfile2.noarch                 \\
texlive-atveryend.noarch                   \\
texlive-auto-pst-pdf.noarch                \\
texlive-auxhook.noarch                     \\
texlive-avantgar.noarch                    \\
texlive-awesomebox.noarch                  \\
texlive-babel.noarch                       \\
texlive-babel-english.noarch               \\
texlive-babelbib.noarch                    \\
texlive-base.x86_64                        \\
texlive-beamer.noarch                      \\
texlive-bera.noarch                        \\
texlive-beton.noarch                       \\
texlive-biblatex.noarch                    \\
texlive-bibtex.x86_64                      \\
texlive-bidi.noarch                        \\
texlive-bidi-atbegshi.noarch               \\
texlive-bidicontour.noarch                 \\
texlive-bidipagegrid.noarch                \\
texlive-bidipresentation.noarch            \\
texlive-bidishadowtext.noarch              \\
texlive-bigfoot.noarch                     \\
texlive-bigintcalc.noarch                  \\
texlive-bitset.noarch                      \\
texlive-bookman.noarch                     \\
texlive-bookmark.noarch                    \\
texlive-booktabs.noarch                    \\
texlive-breakurl.noarch                    \\
texlive-breqn.noarch                       \\
texlive-businesscard-qrcode.noarch         \\
texlive-capt-of.noarch                     \\
texlive-caption.noarch                     \\
texlive-carlisle.noarch                    \\
texlive-catchfile.noarch                   \\
texlive-changepage.noarch                  \\
texlive-charter.noarch                     \\
texlive-cite.noarch                        \\
texlive-cjk.noarch                         \\
texlive-cjk-ko.noarch                      \\
texlive-cm.noarch                          \\
texlive-cm-super.noarch                    \\
texlive-cmap.noarch                        \\
texlive-cmextra.noarch                     \\
texlive-cns.noarch                         \\
texlive-collection-basic.noarch            \\
texlive-collection-fontsrecommended.noarch \\
texlive-collection-latex.noarch            \\
texlive-collection-latexrecommended.noarch \\
texlive-collection-xetex.noarch            \\
texlive-colorprofiles.noarch               \\
texlive-colortbl.noarch                    \\
texlive-courier.noarch                     \\
texlive-cqubeamer.noarch                   \\
texlive-crop.noarch                        \\
texlive-csquotes.noarch                    \\
texlive-ctable.noarch                      \\
texlive-ctablestack.noarch                 \\
texlive-currfile.noarch                    \\
texlive-dehyph.noarch                      \\
texlive-dvipdfmx.x86_64                    \\
texlive-dvipng.x86_64                      \\
texlive-dvips.x86_64                       \\
texlive-ec.noarch                          \\
texlive-enctex.noarch                      \\
texlive-enumitem.noarch                    \\
texlive-environ.noarch                     \\
texlive-epstopdf-pkg.noarch                \\
texlive-eso-pic.noarch                     \\
texlive-etex.noarch                        \\
texlive-etex-pkg.noarch                    \\
texlive-etexcmds.noarch                    \\
texlive-etoolbox.noarch                    \\
texlive-euenc.noarch                       \\
texlive-euler.noarch                       \\
texlive-euro.noarch                        \\
texlive-euro-ce.noarch                     \\
texlive-eurosym.noarch                     \\
texlive-everypage.noarch                   \\
texlive-extsizes.noarch                    \\
texlive-fancybox.noarch                    \\
texlive-fancyhdr.noarch                    \\
texlive-fancyref.noarch                    \\
texlive-fancyvrb.noarch                    \\
texlive-filecontents.noarch                \\
texlive-filehook.noarch                    \\
texlive-finstrut.noarch                    \\
texlive-fix2col.noarch                     \\
texlive-fixlatvian.noarch                  \\
texlive-float.noarch                       \\
texlive-font-change-xetex.noarch           \\
texlive-fontbook.noarch                    \\
texlive-fonts-tlwg.noarch                  \\
texlive-fontspec.noarch                    \\
texlive-fontwrap.noarch                    \\
texlive-footmisc.noarch                    \\
texlive-footnotehyper.noarch               \\
texlive-fp.noarch                          \\
texlive-fpl.noarch                         \\
texlive-garuda-c90.noarch                  \\
texlive-geometry.noarch                    \\
texlive-gettitlestring.noarch              \\
texlive-glyphlist.noarch                   \\
texlive-graphics.noarch                    \\
texlive-graphics-cfg.noarch                \\
texlive-graphics-def.noarch                \\
texlive-grfext.noarch                      \\
texlive-grffile.noarch                     \\
texlive-helvetic.noarch                    \\
texlive-hobsub.noarch                      \\
texlive-hologo.noarch                      \\
texlive-hycolor.noarch                     \\
texlive-hyperref.noarch                    \\
texlive-hyph-utf8.noarch                   \\
texlive-hyphen-base.noarch                 \\
texlive-hyphenex.noarch                    \\
texlive-ifmtarg.noarch                     \\
texlive-ifplatform.noarch                  \\
texlive-iftex.noarch                       \\
texlive-index.noarch                       \\
texlive-infwarerr.noarch                   \\
texlive-intcalc.noarch                     \\
texlive-interchar.noarch                   \\
texlive-jknapltx.noarch                    \\
texlive-kastrup.noarch                     \\
texlive-knuth-lib.noarch                   \\
texlive-knuth-local.noarch                 \\
texlive-koma-script.noarch                 \\
texlive-kotex-plain.noarch                 \\
texlive-kotex-utf.noarch                   \\
texlive-kpathsea.x86_64                    \\
texlive-kvdefinekeys.noarch                \\
texlive-kvoptions.noarch                   \\
texlive-kvsetkeys.noarch                   \\
texlive-l3backend.noarch                   \\
texlive-l3experimental.noarch              \\
texlive-l3kernel.noarch                    \\
texlive-l3packages.noarch                  \\
texlive-latex.noarch                       \\
texlive-latex-fonts.noarch                 \\
texlive-latexbug.noarch                    \\
texlive-latexconfig.noarch                 \\
texlive-letltxmacro.noarch                 \\
texlive-lettrine.noarch                    \\
texlive-lib.x86_64                         \\
texlive-lineno.noarch                      \\
texlive-listings.noarch                    \\
texlive-lm.noarch                          \\
texlive-lm-math.noarch                     \\
texlive-logreq.noarch                      \\
texlive-ltabptch.noarch                    \\
texlive-ltxcmds.noarch                     \\
texlive-ltxmisc.noarch                     \\
texlive-lua-alt-getopt.noarch              \\
texlive-luabidi.noarch                     \\
texlive-luahbtex.x86_64                    \\
texlive-lualatex-math.noarch               \\
texlive-lualibs.noarch                     \\
texlive-luaotfload.noarch                  \\
texlive-luatex.x86_64                      \\
texlive-luatexbase.noarch                  \\
texlive-luatexko.noarch                    \\
texlive-lwarp.noarch                       \\
texlive-makecmds.noarch                    \\
texlive-makeindex.x86_64                   \\
texlive-manfnt-font.noarch                 \\
texlive-marginnote.noarch                  \\
texlive-marvosym.noarch                    \\
texlive-mathpazo.noarch                    \\
texlive-mathspec.noarch                    \\
texlive-mathtools.noarch                   \\
texlive-mdwtools.noarch                    \\
texlive-memoir.noarch                      \\
texlive-metafont.x86_64                    \\
texlive-metalogo.noarch                    \\
texlive-mflogo.noarch                      \\
texlive-mflogo-font.noarch                 \\
texlive-mfnfss.noarch                      \\
texlive-mfware.x86_64                      \\
texlive-microtype.noarch                   \\
texlive-minitoc.noarch                     \\
texlive-mnsymbol.noarch                    \\
texlive-modes.noarch                       \\
texlive-mparhack.noarch                    \\
texlive-mptopdf.noarch                     \\
texlive-ms.noarch                          \\
texlive-multido.noarch                     \\
texlive-na-position.noarch                 \\
texlive-natbib.noarch                      \\
texlive-ncctools.noarch                    \\
texlive-ncntrsbk.noarch                    \\
texlive-newfloat.noarch                    \\
texlive-norasi-c90.noarch                  \\
texlive-notoccite.noarch                   \\
texlive-ntgclass.noarch                    \\
texlive-oberdiek.noarch                    \\
texlive-palatino.noarch                    \\
texlive-paralist.noarch                    \\
texlive-parallel.noarch                    \\
texlive-parskip.noarch                     \\
texlive-pdfcolmk.noarch                    \\
texlive-pdfescape.noarch                   \\
texlive-pdflscape.noarch                   \\
texlive-pdfpages.noarch                    \\
texlive-pdftex.x86_64                      \\
texlive-pdftexcmds.noarch                  \\
texlive-pgf.noarch                         \\
texlive-philokalia.noarch                  \\
texlive-picture.noarch                     \\
texlive-placeins.noarch                    \\
texlive-plain.noarch                       \\
texlive-polyglossia.noarch                 \\
texlive-psfrag.noarch                      \\
texlive-pslatex.noarch                     \\
texlive-psnfss.noarch                      \\
texlive-pspicture.noarch                   \\
texlive-pst-3d.noarch                      \\
texlive-pst-coil.noarch                    \\
texlive-pst-eps.noarch                     \\
texlive-pst-fill.noarch                    \\
texlive-pst-grad.noarch                    \\
texlive-pst-math.noarch                    \\
texlive-pst-node.noarch                    \\
texlive-pst-ovl.noarch                     \\
texlive-pst-plot.noarch                    \\
texlive-pst-text.noarch                    \\
texlive-pst-tools.noarch                   \\
texlive-pst-tree.noarch                    \\
texlive-pstricks.noarch                    \\
texlive-pstricks-add.noarch                \\
texlive-ptext.noarch                       \\
texlive-pxfonts.noarch                     \\
texlive-qstest.noarch                      \\
texlive-quran.noarch                       \\
texlive-quran-de.noarch                    \\
texlive-ragged2e.noarch                    \\
texlive-rcs.noarch                         \\
texlive-realscripts.noarch                 \\
texlive-refcount.noarch                    \\
texlive-rerunfilecheck.noarch              \\
texlive-rsfs.noarch                        \\
texlive-sansmath.noarch                    \\
texlive-sansmathaccent.noarch              \\
texlive-sauerj.noarch                      \\
texlive-scheme-basic.noarch                \\
texlive-section.noarch                     \\
texlive-sectsty.noarch                     \\
texlive-seminar.noarch                     \\
texlive-sepnum.noarch                      \\
texlive-setspace.noarch                    \\
texlive-showexpl.noarch                    \\
texlive-simple-resume-cv.noarch            \\
texlive-simple-thesis-dissertation.noarch  \\
texlive-soul.noarch                        \\
texlive-stringenc.noarch                   \\
texlive-subfig.noarch                      \\
texlive-svn-prov.noarch                    \\
texlive-symbol.noarch                      \\
texlive-t2.noarch                          \\
texlive-tetragonos.noarch                  \\
texlive-tex.x86_64                         \\
texlive-tex-gyre.noarch                    \\
texlive-tex-gyre-math.noarch               \\
texlive-tex-ini-files.noarch               \\
texlive-texlive-common-doc.noarch          \\
texlive-texlive-docindex.noarch            \\
texlive-texlive-en.noarch                  \\
texlive-texlive-msg-translations.noarch    \\
texlive-texlive-scripts.noarch             \\
texlive-texlive.infra.noarch               \\
texlive-textcase.noarch                    \\
texlive-thumbpdf.noarch                    \\
texlive-times.noarch                       \\
texlive-tipa.noarch                        \\
texlive-titlesec.noarch                    \\
texlive-tools.noarch                       \\
texlive-translator.noarch                  \\
texlive-transparent.noarch                 \\
texlive-trimspaces.noarch                  \\
texlive-txfonts.noarch                     \\
texlive-typehtml.noarch                    \\
texlive-ucharcat.noarch                    \\
texlive-ucharclasses.noarch                \\
texlive-ucs.noarch                         \\
texlive-uhc.noarch                         \\
texlive-ulem.noarch                        \\
texlive-underscore.noarch                  \\
texlive-unicode-bidi.noarch                \\
texlive-unicode-data.noarch                \\
texlive-unicode-math.noarch                \\
texlive-uniquecounter.noarch               \\
texlive-unisugar.noarch                    \\
texlive-updmap-map.noarch                  \\
texlive-url.noarch                         \\
texlive-utopia.noarch                      \\
texlive-varwidth.noarch                    \\
texlive-wadalab.noarch                     \\
texlive-was.noarch                         \\
texlive-wasy.noarch                        \\
texlive-wasy-type1.noarch                  \\
texlive-wasysym.noarch                     \\
texlive-wrapfig.noarch                     \\
texlive-xcolor.noarch                      \\
texlive-xdvi.x86_64                        \\
texlive-xebaposter.noarch                  \\
texlive-xechangebar.noarch                 \\
texlive-xecjk.noarch                       \\
texlive-xecolor.noarch                     \\
texlive-xecyr.noarch                       \\
texlive-xeindex.noarch                     \\
texlive-xesearch.noarch                    \\
texlive-xespotcolor.noarch                 \\
texlive-xetex.x86_64                       \\
texlive-xetex-itrans.noarch                \\
texlive-xetex-pstricks.noarch              \\
texlive-xetex-tibetan.noarch               \\
texlive-xetexconfig.noarch                 \\
texlive-xetexfontinfo.noarch               \\
texlive-xetexko.noarch                     \\
texlive-xevlna.noarch                      \\
texlive-xifthen.noarch                     \\
texlive-xkeyval.noarch                     \\
texlive-xltxtra.noarch                     \\
texlive-xpatch.noarch                      \\
texlive-xstring.noarch                     \\
texlive-xunicode.noarch                    \\
texlive-zapfchan.noarch                    \\
texlive-zapfding.noarch                    \\
texlive-zref.noarch                        \\
