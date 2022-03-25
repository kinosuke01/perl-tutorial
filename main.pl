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

# 変数代入
my $x = "Perl";
print "Hello, $x\n";

# if文
my $a = 5;
if ($a > 3) {
     print "$a > 3\n";
} else {
    print "$a <= 3\n";
}

# 繰り返し
foreach my $num (1 .. 10) {
    print $num;
    print " ";
}
print "\n";

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

# モジュールの利用
# モジュール名は先頭が大文字
use Cwd;
print getcwd(), "\n";

# オブジェクト指向
# extends
# with
# アロー演算子
# CPAN

# テスト

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
