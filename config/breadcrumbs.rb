crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypages_path
  parent :root
end

crumb :mypage_card do
  link "支払い方法", mypage_card_path
  parent :mypage
end
