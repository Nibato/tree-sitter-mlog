; Comments
(comment) @comment
(doc_comment) @comment.documentation

; Literals
(string) @string
(escape_sequence) @string.escape
(number) @number
(constant) @constant.builtin

; Labels (declaration site)
(label name: (identifier) @label)

; Every instruction's first word (set, op, jump, ucontrol, ...)
(instruction name: (instruction_name) @keyword)

; `op` / `jump` operator & math function names used as arguments
(instruction
  argument: (identifier) @function.builtin
  (#any-of? @function.builtin
    "add" "sub" "mul" "div" "idiv" "mod" "emod" "pow"
    "equal" "notEqual" "land" "lessThan" "lessThanEq"
    "greaterThan" "greaterThanEq" "strictEqual"
    "shl" "shr" "ushr" "or" "and" "xor" "not"
    "max" "min" "angle" "angleDiff" "len" "noise" "abs" "sign"
    "log" "logn" "log10" "floor" "ceil" "round" "sqrt" "rand"
    "sin" "cos" "tan" "asin" "acos" "atan" "always"))

; radar / uradar filters, control / ucontrol sub-ops, ulocate types,
; and status effects: closed-vocabulary "mode" arguments
(instruction
  argument: (identifier) @type
  (#any-of? @type
    "any" "enemy" "ally" "player" "attacker" "flying" "boss" "ground"
    "health" "shield" "armor" "maxHealth" "distance"
    "enabled" "shoot" "shootp" "config" "color"
    "idle" "move" "approach" "pathfind" "autoPathfind" "boost"
    "target" "targetp" "itemDrop" "itemTake" "payDrop" "payTake"
    "payEnter" "mine" "flag" "build" "getBlock" "within" "unbind"
    "core" "storage" "generator" "turret" "factory" "repair"
    "battery" "reactor" "ore" "damaged" "spawn"
    "burning" "freezing" "unmoving" "wet" "melting" "sapped"
    "electrified" "spore-slowed" "tarred" "overdrive" "overclock"
    "shocked" "blasted"))

; booleans / null
(instruction
  argument: (identifier) @boolean
  (#any-of? @boolean "true" "false"))

(instruction
  argument: (identifier) @constant.builtin
  (#eq? @constant.builtin "null"))

; every other argument identifier is a plain variable
(instruction
  argument: (identifier) @variable
  (#not-any-of? @variable
    "add" "sub" "mul" "div" "idiv" "mod" "emod" "pow"
    "equal" "notEqual" "land" "lessThan" "lessThanEq"
    "greaterThan" "greaterThanEq" "strictEqual"
    "shl" "shr" "ushr" "or" "and" "xor" "not"
    "max" "min" "angle" "angleDiff" "len" "noise" "abs" "sign"
    "log" "logn" "log10" "floor" "ceil" "round" "sqrt" "rand"
    "sin" "cos" "tan" "asin" "acos" "atan" "always"
    "any" "enemy" "ally" "player" "attacker" "flying" "boss" "ground"
    "health" "shield" "armor" "maxHealth" "distance"
    "enabled" "shoot" "shootp" "config" "color"
    "idle" "move" "approach" "pathfind" "autoPathfind" "boost"
    "target" "targetp" "itemDrop" "itemTake" "payDrop" "payTake"
    "payEnter" "mine" "flag" "build" "getBlock" "within" "unbind"
    "core" "storage" "generator" "turret" "factory" "repair"
    "battery" "reactor" "ore" "damaged" "spawn"
    "burning" "freezing" "unmoving" "wet" "melting" "sapped"
    "electrified" "spore-slowed" "tarred" "overdrive" "overclock"
    "shocked" "blasted"
    "true" "false" "null"))
