/**
 * A minimal tree-sitter grammar for Mindustry Logic (mlog), written for
 * syntax highlighting purposes (not validation). mlog is line-oriented:
 * each line is a comment, a label ("name:"), or an instruction followed
 * by whitespace-separated arguments (identifiers, numbers, strings,
 * or @-prefixed built-in constants).
 */

module.exports = grammar({
  name: "mlog",

  extras: ($) => [/[ \t\r]/, $.comment, $.doc_comment],

  rules: {
    source_file: ($) => seq(repeat($._line), optional($._statement)),

    _line: ($) => seq(optional($._statement), $._newline),

    _statement: ($) => choice($.label, $.instruction),

    _newline: (_) => "\n",

    doc_comment: (_) => token(seq("##", /[^\n]*/)),

    comment: (_) => token(seq("#", /[^\n]*/)),

    label: ($) => seq(field("name", $.identifier), ":"),

    instruction: ($) =>
      seq(field("name", alias($.identifier, $.instruction_name)), repeat(field("argument", $._argument))),

    _argument: ($) => choice($.string, $.number, $.constant, $.identifier),

    constant: (_) => /@[A-Za-z_][A-Za-z0-9_-]*/,

    string: ($) => seq('"', repeat(choice(/[^"\\\n]/, $.escape_sequence)), '"'),

    escape_sequence: (_) => /\\./,

    number: (_) =>
      token(
        choice(
          /[+-]?[0-9]+\.[0-9]+/,
          /[+-]?[0-9]+/,
          /0x[0-9a-fA-F]+/,
          /0b[01]+/
        )
      ),

    identifier: (_) => /[A-Za-z_][A-Za-z0-9_.\-]*/,
  },
});
