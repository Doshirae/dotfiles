--- old-scheme.vim      2008-08-16 09:35:17.000000000 +0800
+++ scheme.vim  2008-08-16 09:34:38.000000000 +0800
@@ -29,6 +29,11 @@
 syn match      schemeError     oneline    ![^ \t()\[\]";]*!
 syn match      schemeError     oneline    ")"
 
+" Add TempStruc before Struc and Quoted.
+" although TempStruc will be overwritten by them when do hightlighting,
+" it still can be used to delimit a sexp.
+syn region schemeTempStruc start="(" end=")" contained transparent contains=schemeTempStruc
+
 " Quoted and backquoted stuff
 
 syn region schemeQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
@@ -231,8 +236,13 @@
 
 
 if exists("b:is_chicken") || exists("is_chicken")
+    syn match schemeChar oneline "#\\return"
+    syn match schemeChar oneline "#!eof"
+
     " multiline comment
     syntax region schemeMultilineComment start=/#|/ end=/|#/ contains=schemeMultilineComment
+    syn region schemeSexpComment start="#;(" end=")" contains=schemeComment,schemeTempStruc
+    hi def link schemeSexpComment Comment
 
     syn match schemeOther oneline    "##[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
     syn match schemeExtSyntax oneline    "#:[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
@@ -268,6 +278,9 @@
     " suggested by Alex Queiroz
     syn match schemeExtSyntax oneline    "#![-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
     syn region schemeString start=+#<#\s*\z(.*\)+ end=+^\z1$+ 
+
+    syn match schemeShebang "^#!/.*csi.*$"
+    hi def link schemeShebang Comment
 endif
 
 " Synchronization and the wrapping up...
