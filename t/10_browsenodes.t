# -*- mode: cperl; -*-
# use strict; Test::Baseがuse strictしてくれる
use Test::Base;

use Net::Amazon::Property;
use Net::Amazon::PropertyExt;

plan tests => 1 * blocks;

filters {
    input    => [qw(eval)],
    expected => [qw(eval)],
};

run {
    my $block = shift;

    my $xmlref  = { BrowseNodes => { BrowseNode => $block->input } };
    my $prop    = Net::Amazon::Property->new(xmlref => $xmlref);
    my $propext = Net::Amazon::PropertyExt->new($prop);
    my $testee  = $propext->BrowseNodes;

    is_deeply $testee, $block->expected;
}

__END__
=== test two
--- input
[
  {
    'Ancestors' => {
      'BrowseNode' => {
        'Ancestors' => {
          'BrowseNode' => {
            'Ancestors' => {},
            'BrowseNodeId' => '465392',
            'Name' => "本"
          }
        },
        'BrowseNodeId' => '465610',
        'IsCategoryRoot' => '1',
        'Name' => "ジャンル別"
      }
    },
    'BrowseNodeId' => '466298',
    'Name' => "コンピュータ・インターネット",
    'Children' => {
      'BrowseNode' => [
        {
          'BrowseNodeId' => '492346',
          'Name' => "一般・入門書"
        },
        {
          'BrowseNodeId' => '492350',
          'Name' => "コンピュータサイエンス"
        },
        {
          'BrowseNodeId' => '492330',
          'Name' => "ハードウェア・周辺機器"
        },
        {
          'BrowseNodeId' => '502754',
          'Name' => "モバイル・iモード"
        },
        {
          'BrowseNodeId' => '492336',
          'Name' => 'OS'
        },
        {
          'BrowseNodeId' => '492344',
          'Name' => "ネットワーク"
        },
        {
          'BrowseNodeId' => '492332',
          'Name' => "インターネット・Web開発"
        },
        {
          'BrowseNodeId' => '492062',
          'Name' => "e-ビジネス"
        },
        {
          'BrowseNodeId' => '492352',
          'Name' => "プログラミング"
        },
        {
          'BrowseNodeId' => '492342',
          'Name' => "アプリケーション"
        },
        {
          'BrowseNodeId' => '502740',
          'Name' => "データベース"
        },
        {
          'BrowseNodeId' => '492334',
          'Name' => "デザイン・グラフィックス"
        },
        {
          'BrowseNodeId' => '525610',
          'Name' => "デジタルエンターテイメント"
        },
        {
          'BrowseNodeId' => '492356',
          'Name' => "事典・各種試験対策"
        },
        {
          'BrowseNodeId' => '548080',
          'Name' => "シリーズ別"
        },
        {
          'BrowseNodeId' => '548098',
          'Name' => "出版社別"
        },
        {
          'BrowseNodeId' => '547670',
          'Name' => "コンピュータ・インターネット 全般"
        }
      ]
    },
  },
  {
    'Ancestors' => {
      'BrowseNode' => {
        'Ancestors' => {
          'BrowseNode' => {
            'Ancestors' => {},
            'BrowseNodeId' => '465392',
            'Name' => "本"
          }
        },
        'BrowseNodeId' => '638878',
        'Name' => 'By Formats'
      }
    },
    'BrowseNodeId' => '3364991',
    'Name' => "新刊・予約コーナー"
  },
  {
    'Ancestors' => {
      'BrowseNode' => {
        'Ancestors' => {
          'BrowseNode' => {
            'Ancestors' => {},
            'BrowseNodeId' => '465392',
            'Name' => "本"
          }
        },
        'BrowseNodeId' => '465614',
        'Name' => 'By Publishers'
      }
    },
    'BrowseNodeId' => '10805871',
    'Name' => "技術評論社"
  },
  {
    'Ancestors' => {
      'BrowseNode' => {
        'Ancestors' => {
          'BrowseNode' => {
            'Ancestors' => {
              'BrowseNode' => {
                'Ancestors' => {
                  'BrowseNode' => {
                    'Ancestors' => {},
                    'BrowseNodeId' => '465392',
                    'Name' => "本"
                  }
                },
                'BrowseNodeId' => '388316011',
                'Name' => 'Refinements'
              }
            },
            'BrowseNodeId' => '625255011',
            'Name' => 'Browse Refinements'
          }
        },
        'BrowseNodeId' => '625256011',
        'Name' => 'Format (binding)'
      }
    },
    'BrowseNodeId' => '625257011',
    'Name' => "ペーパーバック"
  }
]
--- expected
[
  bless( {
    'BrowseNodeId' => '466298',
    'Name' => "コンピュータ・インターネット"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492346',
    'Name' => "一般・入門書"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492350',
    'Name' => "コンピュータサイエンス"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492330',
    'Name' => "ハードウェア・周辺機器"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '502754',
    'Name' => "モバイル・iモード"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492336',
    'Name' => 'OS'
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492344',
    'Name' => "ネットワーク"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492332',
    'Name' => "インターネット・Web開発"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492062',
    'Name' => "e-ビジネス"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492352',
    'Name' => "プログラミング"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492342',
    'Name' => "アプリケーション"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '502740',
    'Name' => "データベース"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492334',
    'Name' => "デザイン・グラフィックス"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '525610',
    'Name' => "デジタルエンターテイメント"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '492356',
    'Name' => "事典・各種試験対策"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '548080',
    'Name' => "シリーズ別"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '548098',
    'Name' => "出版社別"
  }, 'Net::Amazon::BrowseNode' ),
  bless( {
    'BrowseNodeId' => '547670',
    'Name' => "コンピュータ・インターネット 全般"
  }, 'Net::Amazon::BrowseNode' )
]
