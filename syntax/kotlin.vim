" Vim syntax file
" Language:     Kotlin
" Maintainer:   Alexander Udalov
" URL:          https://github.com/udalov/kotlin-vim
" Last Change:  7 November 2021

if exists('b:current_syntax')
    finish
endif

function! ExtendGroup(base, group, add)
    exec 'hi link ' . a:group . ' ' . a:base
    exec 'hi ' . a:group .
                \ ' ctermfg=' . synIDattr(synIDtrans(hlID(a:base)), 'fg', 'cterm') .
                \ ' guifg=' . synIDattr(synIDtrans(hlID(a:base)), 'fg', 'gui') .
                \ ' ' . a:add
endfunction

call ExtendGroup('Boolean', 'EnumMember', 'gui=italic')

syn keyword ktStatement break continue return
syn keyword ktConditional if else when
syn keyword ktRepeat do for while
syn keyword ktOperator in is by
syn keyword ktKeyword get set out super this where it
syn keyword ktException try catch finally throw

syn keyword ktInclude import package nextgroup=ktTypeImport,ktFunctionImport
" Rely on naming conventions to determine whether an imported symbol is a type or function...
syn match ktTypeImport "\v(import ([^\.]+\.)+)@<=[A-Z][A-Za-z0-9_]+$"
syn match ktFunctionImport "\v(import ([^\.]+\.)+)@<=[a-z_][A-Za-z0-9_]+$"


" Generated stdlib class names {{{
" The following is generated by https://github.com/udalov/kotlin-vim/blob/master/extra/generate-stdlib-class-names.main.kts
syn keyword ktType AbstractCollection AbstractCoroutineContextElement AbstractCoroutineContextKey AbstractDoubleTimeSource AbstractIterator AbstractList AbstractLongTimeSource
syn keyword ktType AbstractMap AbstractMutableCollection AbstractMutableList AbstractMutableMap AbstractMutableSet AbstractSet AccessDeniedException Accessor Annotation
syn keyword ktType AnnotationRetention AnnotationTarget Any Appendable ArithmeticException Array ArrayDeque ArrayList AssertionError Boolean BooleanArray BooleanIterator
syn keyword ktType BuilderInference Byte ByteArray ByteIterator CName CallsInPlace CancellationException Char CharArray CharCategory CharDirectionality CharIterator CharProgression
syn keyword ktType CharRange CharSequence CharacterCodingException Charsets ClassCastException Cloneable ClosedFloatingPointRange ClosedRange Collection Comparable Comparator
syn keyword ktType ConcurrentModificationException ConditionalEffect Continuation ContinuationInterceptor ContractBuilder CoroutineContext DeepRecursiveFunction DeepRecursiveScope
syn keyword ktType Delegates Deprecated DeprecatedSinceKotlin DeprecationLevel Destructured Double DoubleArray DoubleIterator DslMarker Duration DurationUnit Effect Element
syn keyword ktType EmptyCoroutineContext Entry Enum Error Exception Experimental ExperimentalContracts ExperimentalJsExport ExperimentalMultiplatform ExperimentalStdlibApi
syn keyword ktType ExperimentalTime ExperimentalTypeInference ExperimentalUnsignedTypes ExtensionFunctionType FileAlreadyExistsException FileSystemException FileTreeWalk
syn keyword ktType FileWalkDirection Float FloatArray FloatIterator Function Function0 Function1 Function10 Function11 Function12 Function13 Function14 Function15 Function16
syn keyword ktType Function17 Function18 Function19 Function2 Function20 Function21 Function22 Function3 Function4 Function5 Function6 Function7 Function8 Function9 FunctionN
syn keyword ktType Getter Grouping HashMap HashSet IllegalArgumentException IllegalStateException IndexOutOfBoundsException IndexedValue Int IntArray IntIterator IntProgression
syn keyword ktType IntRange InvocationKind Iterable Iterator JsEagerInitialization JsExport JsName JvmDefault JvmDefaultWithoutCompatibility JvmField JvmInline JvmMultifileClass
syn keyword ktType JvmName JvmOverloads JvmRecord JvmStatic JvmSuppressWildcards JvmSynthetic JvmWildcard KAnnotatedElement KCallable KClass KClassifier KDeclarationContainer
syn keyword ktType KFunction KMutableProperty KMutableProperty0 KMutableProperty1 KMutableProperty2 KParameter KProperty KProperty0 KProperty1 KProperty2 KType KTypeParameter
syn keyword ktType KTypeProjection KVariance KVisibility Key Kind KotlinNullPointerException KotlinReflectionNotSupportedError KotlinVersion Lazy LazyThreadSafetyMode Level
syn keyword ktType LinkedHashMap LinkedHashSet List ListIterator Long LongArray LongIterator LongProgression LongRange Map MatchGroup MatchGroupCollection MatchNamedGroupCollection
syn keyword ktType MatchResult Metadata Monotonic MustBeDocumented MutableCollection MutableEntry MutableIterable MutableIterator MutableList MutableListIterator MutableMap
syn keyword ktType MutableSet NoSuchElementException NoSuchFileException NoWhenBranchMatchedException NotImplementedError Nothing NullPointerException Number NumberFormatException
syn keyword ktType ObservableProperty OnErrorAction OptIn OptionalExpectation OverloadResolutionByLambdaReturnType Pair ParameterName PropertyDelegateProvider PublishedApi
syn keyword ktType PurelyImplements Random RandomAccess ReadOnlyProperty ReadWriteProperty Regex RegexOption Repeatable ReplaceWith RequiresOptIn RestrictsSuspension Result
syn keyword ktType Retention Returns ReturnsNotNull RuntimeException Sequence SequenceScope Set Setter SharedImmutable Short ShortArray ShortIterator SimpleEffect SinceKotlin
syn keyword ktType Strictfp String StringBuilder Suppress Synchronized Target TestTimeSource ThreadLocal Throwable Throws TimeMark TimeSource TimedValue Transient Triple
syn keyword ktType TypeCastException Typography UByte UByteArray UByteIterator UInt UIntArray UIntIterator UIntProgression UIntRange ULong ULongArray ULongIterator ULongProgression
syn keyword ktType ULongRange UShort UShortArray UShortIterator UninitializedPropertyAccessException Unit UnsafeVariance UnsupportedOperationException UseExperimental Volatile
" }}}

syn match ktGenericType "\v[A-Za-z_][A-Za-z0-9_]*\<( ?[A-Za-z_]+[A-Za-z0-9_<>, ]*)\>\??"
syn match ktGeneric "\v\<(.*)\>\??" contains=ktType
syn match ktEnum "\v[A-Z][A-Za-z]*\ze(\.[A-Z_]+)" nextgroup=ktEnumMember " Assume that all enums are PascalCase
syn match ktEnumMember "\v([A-Z][A-Za-z]*\.)@<=[A-Z_]+" " and that all enum members use SCREAMING_SNAKE_CASE

syn keyword ktStructure class object interface typealias fun constructor init return
syn keyword ktDeclStruct val var

syn match ktIdentifier "_?[[:alpha:]]\+[[:digit:]]*"
syn match ktFunction /\<\K\k*\ze\s*(/

syn keyword ktModifier annotation companion enum inner abstract final open override sealed vararg dynamic expect actual suspend

syn keyword ktReservedKeyword typeof

syn keyword ktBoolean true false
syn keyword ktConstant null

syn keyword ktModifier reified external inline noinline crossinline

syn match ktModifier "\v<data>\ze\@=.*<(class|object)>"
syn match ktModifier "\v<value>\ze\@=.*<class>"
syn match ktModifier "\v<(tailrec|operator|infix)>\ze\@=.*<fun>"
syn match ktModifier "\v<const>\ze\@=.*<val>"
syn match ktModifier "\v<lateinit>\ze\@=.*<var>"
syn match ktModifier "\v<(internal|private|protected|public)>\ze\@=.*<(class|object|interface|typealias|fun|val|var|constructor|get|set)>"

syn match ktOperator "\v\?:|::|\<\=? | \>\=?|[!=]\=\=?|<as>\??|[-*+/%]\=?|[!&|]"

syn keyword ktTodo TODO FIXME XXX contained
syn match ktShebang "\v^#!.*$"
syn match ktLineComment "\v//.*$" contains=ktTodo,@Spell
syn region ktComment matchgroup=ktCommentMatchGroup start="/\*" end="\*/" contains=ktComment,ktTodo,@Spell

syn region ktDocComment start="/\*\*" end="\*/" contains=ktDocTag,ktTodo,@Spell
syn match ktDocTag "\v\@(author|constructor|receiver|return|since|suppress)>" contained
syn match ktDocTag "\v\@(exception|param|property|throws|see|sample)>\s*\S+" contains=ktDocTagParam contained
syn match ktDocTagParam "\v(\s|\[)\S+" contained
syn match ktComment "/\*\*/"

syn match ktSpecialCharError "\v\\." contained
syn match ktSpecialChar "\v\\([tbnr'"$\\]|u\x{4})" contained
syn region ktString start='"' skip='\\"' end='"' contains=ktSimpleInterpolation,ktComplexInterpolation,ktSpecialChar,ktSpecialCharError,@Spell
syn region ktString start='"""' end='""""*' contains=ktSimpleInterpolation,ktComplexInterpolation,@Spell
syn match ktCharacter "\v'[^']*'" contains=ktSpecialChar,ktSpecialCharError
syn match ktCharacter "\v'\\''" contains=ktSpecialChar
syn match ktCharacter "\v'[^\\]'"

syn match ktAnnotation "\v(\w)@<!\@[[:alnum:]_.]*(:[[:alnum:]_.]*)?"
syn match ktLabel "\v\w+\@"
syn match ktLabel "\v(\w)@<=\@\w+"

syn match ktSimpleInterpolation "\v\$\h\w*" contained
syn region ktComplexInterpolation matchgroup=ktComplexInterpolationBrace start="\v\$\{" end="\v\}" contains=ALLBUT,ktSimpleInterpolation,ktTodo,ktSpecialCharError,ktSpecialChar,ktDocTag,ktDocTagParam

syn match ktNumber "\v<\d+[_[:digit:]]*(uL?|UL?|[LFf])?"
syn match ktNumber "\v<0[Xx]\x+[_[:xdigit:]]*(uL?|UL?|L)?"
syn match ktNumber "\v<0[Bb][01]+[_01]*(uL?|UL?|L)?"
syn match ktFloat "\v<\d*(\d[eE][-+]?\d+|\.\d+([eE][-+]?\d+)?)[Ff]?"

syn match ktEscapedName "\v`.*`"

syn match ktExclExcl "!!"
syn match ktArrow "->"

syn region ktFold start="{" end="}" transparent fold

exec "syntax sync ccomment ktComment minlines=10"

hi def link ktStatement Statement
hi def link ktConditional Conditional
hi def link ktRepeat Repeat
hi def link ktOperator Operator
hi def link ktKeyword Keyword
hi def link ktException Exception
hi def link ktReservedKeyword Error

hi def link ktInclude Include
hi def link ktTypeImport Type
hi def link ktFunctionImport Function

hi def link ktType Type
hi def link ktGenericType Type
hi def link ktGeneric Type
hi def link ktModifier StorageClass
hi def link ktStructure Structure
hi def link ktDeclStruct Structure
hi def link ktTypedef Typedef

hi def link ktEnum Type
hi def link ktEnumMember EnumMember

hi def link ktBoolean Boolean
hi def link ktConstant Constant

hi def link ktTodo Todo
hi def link ktShebang Comment
hi def link ktLineComment Comment
hi def link ktComment Comment
hi def link ktCommentMatchGroup Comment
hi def link ktDocComment Comment
hi def link ktDocTag Special
hi def link ktDocTagParam Identifier

hi def link ktSpecialChar SpecialChar
hi def link ktSpecialCharError Error
hi def link ktString String
hi def link ktCharacter Character

hi def link ktAnnotation Identifier
hi def link ktLabel Identifier

hi def link ktSimpleInterpolation Identifier
hi def link ktComplexInterpolationBrace Identifier

hi def link ktNumber Number
hi def link ktFloat Float

hi def link ktExclExcl Special
hi def link ktArrow Structure

hi def link ktFunction Function
hi def link ktIdentifier Identifier

let b:current_syntax = 'kotlin'

" vim:foldmethod=marker
