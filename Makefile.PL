use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Text::Chomp',
    AUTHOR              => 'Steve Peters <steve@fisharerojo.org>',
    VERSION_FROM        => 'lib/Text/Chomp.pm',
    ABSTRACT_FROM       => 'lib/Text/Chomp.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Text-Chomp-*' },
);
