#!/usr/bin/env perl6

# Example from Perl deep dive: https://www.packtpub.com/application-development/perl-6-deep-dive

grammar G {
    rule TOP {
        ^
[ <statement> \s* <comment>? ]*
$
    }
    rule statement {
        [
        | <variable-declaration>
| <assignment>
| <say-function>
]
        ';'
}
    rule comment {
        '#' <-[\n]>*
}
    rule variable-declaration {
        'my' <variable>
}
    token variable {
        <sigil> <identifier>
    }
    token sigil {
        '$' | '@'
    }
    token identifier {
        <alpha> <alnum>*
    }
    rule assignment {
        <variable> '=' <expression>
}
    rule expression {
        | <term> '+' <expression>
| <value>
| <variable>
}
    rule term {
        | <value>
| <variable>
}
    token value {
        <number>
     }
    token number {
        <digit>+
    }
    rule say-function {
        'say' <variable>
}
}
class A {
    has %!var;
    method variable-declaration($/) {
        %!var{$<variable><sigil>}{$<variable><identifier>} =
                'undefined';
    }
    method variable($/) {
        $/.make(%!var{$<sigil>}{$<identifier>})
    }
    method assignment($/) {
        %!var{$<variable><sigil>}{$<variable><identifier>} =
                $<expression>.ast;
    }
    method value($/) {
        $/.make(+$<number>)
    }
    method say-function($/) {
        say %!var{$<variable><sigil>}{$<variable><identifier>};
    }
    multi method term($/ where $/<value>) {
        $/.make($<value>.ast)
    }
    multi method term($/ where $/<variable>) {
        $/.make($<variable>.ast)
    }
    multi method expression($/ where $/<term>) {
        $/.make($<term>.ast + $<expression>.ast)
    }
    multi method expression($/ where $/<value>) {
        $/.make(~$<value>)
    }
    multi method expression($/ where $/<variable>) {
        $/.make(%!var{$<variable><sigil>}{$<variable><identifier>})
    }
}
my $prog = q:to/END/;
my $x;
$x = 5;
say $x;# 5
my $y;
$y = $x;
say $y; # 5
my $z;
$z = $x + $y;
say $z; # 10
my $sum;
$sum = 10 + 12 + $x + $y + $z;
say $sum; # 42
END

my $result = G.parse($prog, :actions(A.new));
say $result;