package Person;

use Moose;

# attributesの定義
has 'first_name' => (
    is => 'rw',
    isa => 'Str',
);
has 'last_name' => (
    is => 'rw',
    isa => 'Str',
);

# メソッドの定義
sub say {
    my $self = shift;
    my $full_name = $self->first_name . ' ' . $self->last_name . "\n";
    print($full_name);
}

# Mooseのシュガー関数がクラスの名前空間から消える
no Moose;

# クラスを不変化することによる高速化
__PACKAGE__->meta->make_immutable;

1;
