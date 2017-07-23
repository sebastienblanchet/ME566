function [ vect ] = expref( table, trgt, offset )
    vect = table(((table(:,2) == trgt) & (table(:,1)>=0)),offset);
end

