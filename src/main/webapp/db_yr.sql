select * from event;
select * from EN_PARTY;

insert into EN_PARTY values (5, 'test1', '사랑');
insert into EN_PARTY values (6, 'test2', '사랑');
insert into EN_PARTY values (7, 'test3', '우정');

SELECT COLUMN_NAME, DATA_TYPE, CHAR_LENGTH
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'EN_PARTY';

select * from MEMBER;
select * from event;
