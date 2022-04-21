# パッケージ(名前空間)の定義
package My::Main;

# プラグマ - スクリプトのの動作に影響を与える
use strict;   # 安全でない構文でエラーさせる
use warnings; # 選択的な警告を調整？？

=begin
コメント
コメント
コメント
=cut

sub base {
    # 変数代入
    my $x = "Perl";
    print "Hello, $x\n";

    # if文
    # 数値比較
    my $a = 5;
    if ($a > 3) {
        print "$a > 3\n";
    } else {
        print "$a <= 3\n";
    }

    # 文字列比較
    my $str = "abcde";
    # 等しい場合
    if ($str eq "abcde") {
        print "$str eq abcde\n";
    # 異なる場合
    } elsif ($str ne "abcde") {
        print "$str ne abcde\n";
    }

    # 繰り返し
    foreach my $num (1 .. 10) {
        print $num;
        print " ";
    }
    print "\n";

    my $i;
    for ($i = 0; $i < 100; $i++) {
        if ($i > 50) {
            print "\n";
            last; # break;
        }
        print $i . ",";
    }
}
base();

sub array_hash {
    # 配列の定義
    # 配列全体を表す場合は先頭に@がつく
    $a = "taro";
    $b = "jiro";
    my @names = ($a, $b);
    $names[2] = "saburo";
    push(@names, "shiro");
    foreach my $name (@names) {
    print "$name\n"
    }

    # ハッシュの定義
    # ハッシュ全体を表す場合は先頭に%がつく
    my %months = (
        Jan => 'January',
    );
    $months{Feb} = 'February';
    $months{Mar} = 'March';
    $months{Apr} = 'April';
    foreach my $key (keys %months) {
        print $months{$key}, "\n";
    }
}
array_hash();

# サブルーチン - 関数のようなもの
sub max {
    # 引数の受け取り
    # my ($x, $y) = @_; # でもOK
    my $x = shift;
    my $y = shift;

    if ($x > $y) {
        return $x;
    } else {
        return $y;
    }
}
my $result = max(11, 22);
print $result, "\n";

sub str_proc {
    # 正規表現マッチング
    my @prices = (
        '1,000yen', '198yen', '\58,000.-',
    );
    foreach my $price (@prices) {
        # m/xxx/ で数値とカンマのパターンマッチング
        if ($price =~ m/([\d,]+)/) {
            # $1: マッチした最初の要素
            print $1, "\n";
        }
    }

    # 文字列置換
    my $date = 'Sun, 28 Sep 2008 15:03:22 GTM';
    # s/xxx/xxx/g で 数字を*に置換
    $date =~ s/\d/*/g;
    print $date, "\n";
}
str_proc();

# モジュールの利用
# モジュール名は先頭が大文字
use Cwd;
print getcwd(), "\n";

sub reference {
    # $x はスカラー値
    # リファレンスは配列やハッシュのポインタでスカラー値

    my @nums = (1,2,3);      # 配列の作成
    my $nums = \@nums;       # 配列のリファレンスの作成
    my $nums = [1,2,3];      # 無名リファレンスの作成
    my @nums = @{$nums};     # リファレンスから配列実体を取得
    print @nums[0] . "\n";   # 実体から要素参照
    print $nums->[0] . "\n"; # リファレンスから要素参照

    # 配列の要素はスカラー値のみなので、
    # 二次元配列にはリファレンスを登録する
    my @persons1 = ("A", "B", "C");
    my @persons2 = ("X", "Y", "Z");
    my @person_group = ();
    push(@person_group, \@persons1);
    push(@person_group, \@persons2);
    print "person_group.0.0 is " . @person_group[0]->[0] . "\n";

    my %user = (         # ハッシュの作成
        first_name => 'Taro',
        last_name  => 'Yamada',
    ); 
    my $user = \%user;   # ハッシュのリファレンス作成
    my $user = {         # 無名リファレンスからの作成
        first_name => 'Taro',
        last_name  => 'Yamada',
    };
    my %user = %{$user};              # リファレンスから実体を取り出す
    print %user{first_name} . "\n";   # 実体からの要素参照
    print $user->{first_name} . "\n"; # リファレンスからの要素参照

    # ハッシュの要素はスカラー値のみなので、
    # 入れ子ハッシュにはリファレンスを登録する
    my $user1 = {first_name => 'Taro', last_name => 'Yamada'};
    my $user2 = {first_name => 'Jiro', last_name => 'Suzuki'};
    my $user_group = {};
    $user_group->{user1} = $user1;
    $user_group->{user2} = $user2;
    print "user_group.user2.last_name is " . $user_group->{user2}->{last_name} . "\n";
}
reference();

# $@
# evalで例外をキャッチした場合に内容が保存される変数

__END__
__DATA__ と __END__ について
これがある行以降はプログラムとして読み込まれない
__DATA__ 以降のデータは他のパッケージから参照できる
__END__ 以降のデータは他のパッケージから参照できない

欄外に POD(Plain Old Documentation) でドキュメントを書く
`=head1`は<h1>に該当する

=head1 NAME

モジュール名 - モジュールの簡単な解説

=head1 SYNOPSIS

ソースコードのサンプル
