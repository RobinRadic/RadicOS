---
layout: page
title: RadicOS
---
##### Status: Development

I'll blog quite a bit about this. Check the post.

This page is cut/paste from several things, doesn't make much sense now.

Can make a Virtual Machine disk, Live USB/DVD, Persistent usb. Simple installer and i'm working on getting the official opensuse DVD installation working properly, with my own branding and packages/products etc.


So here's what i can do to create several versions of custom linux
{% highlight bash  %}
# I've renamed kiwibuild.sh to radicos and put it in $PATH, therefore i use radicos command
# Before i start creating, i edit line 4: profiles="improved yast2 webserver kde software dev workstation"
# So i could remove webserver, or whatever
radicos prepare
radicos create vmx # build virtual machine
radicos create oem # build installer iso
radicos create iso # buid live distro
radicos installer  # Grabs the official dvd, and usses makeSUSEDvd with a lot of customisations for a full installer disk, with own patterns and branding
{% endhighlight  %}


The cool thing about the branding stuff with SVG files is that they scale. There's not really that much need to alter 100 graphihc files. The makefile that is included does it all (check the repo of openSUSE/branding).

I've still spend quite some time on some stuff. Like ksplashx with QML. It's the animation that u get after login.  I've included it for download, it's quite fancy, just requires a bit of resolution tweaking.

![radic gitinit]({{ site.url }}/images/RadicOS131-1920x1200.jpg). Pretty much all questions are already filled in properly by default. How much times haven't you done:


And you can grab the [animation files and QML code here]({{ site.url }}/images/ksplashx.zip). Sorry no video.. But its great to cheat from and adept into your own ksplashxQML intro...