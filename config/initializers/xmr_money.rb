curr = {
  :priority            => 1,
  :iso_code            => "xmr",
  :iso_numeric         => "846",
  :name                => "Monero",
  :symbol              => "XMR",
  :subunit             => "",
  :subunit_to_unit     => 1000000000000,
  :decimal_mark        => ".",
  :thousands_separator => ""
}


Money::Currency.register(curr)
