class MypagesController < ApplicationController
  def index
    # @favorites=current_user.favorites
  end

  # mypages.js.erbを実行
  def mypages
  end

  # bucknumber.js.erbを実行
  def backnumber
    # レコードの中から重複を許さずグループ名を取り出す
    names=current_user.groups.select("group_name").distinct
    # stock=current_user.groups.select(names[0])

    @lists=[]
    @names=[]

    names.each do |name|
      #グループ名を１つずつ取り出し、その名前が含まれるレコードすべて取得
      #そのレコードの中のcodeカラムの値を含むレコードをすべて取り出す
      stocks=Group.where(group_name: name.group_name).select("code")
      lists=[]
      stocks.each do |stock|
        #[code,銘柄名],リセット
        list=[]
        #codeを入れる
        list.push(stock.code)
        stock_name=Stock.where(code: stock.code).select("name").distinct
        # binding.pry
        #銘柄名を入れる
        list.push(stock_name[0].name.slice(0, 16))
        #リストに入れる
        lists.push(list)
      end
      #キーにポートフォリオ名、
      #バリューにポートフォリオに含まれる銘柄のリストを指定
      #このときnameはレコードなのでカラム名を指定して要素だけ取り出す
      @lists.push(lists)
    end

    names.each do |name|
      @names.push(name.group_name)
    end

  end

  # tsanalyses.js.erbを実行
  def analyses
  end

end



