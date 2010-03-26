class ImportLanguages < ActiveRecord::Migration
  def self.up
    ["ActionScript",
    "Arc",
    "ASP",
    "Boo",
    "C",
    "C Sharp",
    "C++",
    "Clojure",
    "CoffeeScript",
    "ColdFusion",
    "Common Lisp",
    "D",
    "Eiffel",
    "Emacs Lisp",
    "Erlang",
    "FORTRAN",
    "Go",
    "Groovy",
    "Haskell",
    "HaXe",
    "Io",
    "Java",
    "JavaScript",
    "Lua",
    "Nu",
    "Objective-C",
    "Objective-J",
    "OCaml",
    "ooc",
    "Perl",
    "PHP",
    "Pure Data",
    "Python",
    "R",
    "Ruby",
    "Scala",
    "Scheme",
    "sclang",
    "Self",
    "Shell",
    "Smalltalk",
    "SuperCollider",
    "Tcl",
    "Verilog",
    "VHDL",
    "VimL",
    "Visual Basic"].each do |language|
      Language.create(:name => language)
    end
  end

  def self.down
    Language.destroy_all
  end
end
