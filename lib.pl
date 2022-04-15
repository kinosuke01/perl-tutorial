# モジュールの読み込み
# インスタンス化とメソッド実行
use Person;
my $person;
$person = Person->new(first_name => 'Taro', last_name => 'Yamada');
$person->say();

use User;
my $user;
$user = User->new(first_name => 'Jiro', last_name => 'Suzuki');
$user->say();
