class Product
    attr_accessor :id, :pid, :item, :description, :price, :condition, :dimension_w, :dimension_l, :dimension_h, :img_file, :quantity, :category

    def condition=(condition)
    @condition=condition
    if condition == "average"
        @price*=0.9
        str="#{@price} clearance"
        @price = str
    end
    if condition == "good"
        @price*=0.8
        str="#{@price} clearance"
        @price = str
    end
    
    end
end