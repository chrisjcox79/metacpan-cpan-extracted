#--------------------------------------------------------------------
#   Language_uk.pm
#   Generated automatically from uk.po by po2pm
#--------------------------------------------------------------------

sub translations {
    my $tx = shift;

    my %data = (

# Ukrainian translation for FAQ-O-Matic.
# Translated by Andrew W. Nosenko <awn@bcs.zp.ua>, 2001
#
# This is partial translation indeed.  For most phrases appropriate
# Russian phrases is used.  These phrases marked as Russian in comments.
# Contributions of proper Ukrainian translations are welcomed (same as
# any other contributions ;-).
#
# Some words:
# bag     "ͦ���"
# content �ͦ��
# data    �ͦ��   FIXME: ���-������ ���� ���ݦ� ��������?
# define  ���������
# script  ???     FIXME: � ���������� `������', ���...
#
# ATTENTION: don't remove fuzzy mark from this startup entry!
#, fuzzy
 ""
# fuzzy # => "Project-Id-Version: faqomatic 2.711_01\nPOT-Creation-Date: 2001-08-07 14:22+0300\nPO-Revision-Date: 2001-08-06 19:55+0300\nLast-Translator: FULL NAME <EMAIL@ADDRESS>\nLanguage-Team: Ukrainian <someone@somewhere.org>\nMIME-Version: 1.0\nContent-Type: text/plain; charset=koi8-u\nContent-Transfer-Encoding: 8bit\n",
 => "",

#: lib/FAQ/OMatic.pm:95 lib/FAQ/OMatic/install.pm:1040
 "Warnings:"
 => "������������:",

#: lib/FAQ/OMatic.pm:135 lib/FAQ/OMatic/authenticate.pm:151
 "Log In"
 => "�צ���",

#: lib/FAQ/OMatic.pm:136
 "Change Password"
 => "�ͦ���� ������",

#: lib/FAQ/OMatic.pm:137
 "Edit Title of %0 %1"
 => "%0 %1: ����������� ���������",

# Intentionally left blank
#: lib/FAQ/OMatic.pm:138
#, c-format
 "New %0"
 => "",

#: lib/FAQ/OMatic.pm:139
 "Edit Part in %0 %1"
 => "%0 %1: ����������� ������",

#: lib/FAQ/OMatic.pm:140
 "Insert Part in %0 %1"
 => "%0 %1: ������� ������",

#: lib/FAQ/OMatic.pm:141
 "Move %0 %1"
 => "%0 %1: ����ͦ�����",

#: lib/FAQ/OMatic.pm:142 lib/FAQ/OMatic/Appearance.pm:168
 "Search"
 => "�����",

#: lib/FAQ/OMatic.pm:143
 "Access Statistics"
 => "���������� �������",

#: lib/FAQ/OMatic.pm:144 lib/FAQ/OMatic/submitPass.pm:145
 "Validate"
 => "����צ����",

#: lib/FAQ/OMatic.pm:145
 "%0 Permissions for %1"
 => "%0 %1: ��������� �� ����� �������",

#: lib/FAQ/OMatic.pm:146
 "Upload bag for %0 %1"
 => "",

#: lib/FAQ/OMatic/Appearance.pm:177
 "Appearance"
 => "���Φ�Φ� ������",

#: lib/FAQ/OMatic/Appearance.pm:191
 "Show Top Category Only"
 => "�������� ������ ������ ������Ҧ�",

#: lib/FAQ/OMatic/Appearance.pm:198
 "Show This <em>Entire</em> Category"
 => "�������� <em>���� ���</em> ������Ҧ�",

#: lib/FAQ/OMatic/Appearance.pm:209
 "Show This Category As Text"
 => "�������� �� ������Ҧ� �� �����",

#: lib/FAQ/OMatic/Appearance.pm:213
 "Show This Answer As Text"
 => "�������� �� �����צ�� �� �����",

# Intentionally left blank.
#: lib/FAQ/OMatic/Appearance.pm:218
 "Show This %0 As Text"
 => "",

#: lib/FAQ/OMatic/Appearance.pm:232
 "Show This <em>Entire</em> Category As Text"
 => "�������� <em>���� ���</em> ������Ҧ� �� �����",

#: lib/FAQ/OMatic/Appearance.pm:244
 "Hide Expert Edit Commands"
 => "������� ������Φ ������� �����������",

#: lib/FAQ/OMatic/Appearance.pm:253
 "Show Expert Edit Commands"
 => "�������� ������Φ ������� �����������",

#: lib/FAQ/OMatic/Appearance.pm:269 lib/FAQ/OMatic/Item.pm:1955
#: lib/FAQ/OMatic/stats.pm:133
 "Return to the FAQ"
 => "����������� �� FAQ",

#: lib/FAQ/OMatic/Appearance.pm:276
 "This is a"
 => "�� �",

#: lib/FAQ/OMatic/Auth.pm:475
 "the administrator of this Faq-O-Matic"
 => "��ͦΦ������� ����� FAQ-O-Matic'�",

#: lib/FAQ/OMatic/Auth.pm:476
 "someone who has proven their identification"
 => "���-������, ��� � ��Ц��� ������� ������Ʀ��æ�",

#: lib/FAQ/OMatic/Auth.pm:477
 "someone who has offered identification"
 => "���-������, ��� ������Ʀ����� ���� (������ email-������)",

#: lib/FAQ/OMatic/Auth.pm:478
 "anybody"
 => "��� ��������",

#: lib/FAQ/OMatic/Auth.pm:491
 "the moderator of the item"
 => "���������",

#: lib/FAQ/OMatic/Auth.pm:495
#, c-format
 "%0 group members"
 => "����� ����� %0",

#: lib/FAQ/OMatic/Groups.pm:142
 "Select a group to edit:"
 => "�������� ����� ��� �����������:",

#: lib/FAQ/OMatic/Groups.pm:150
 "(Members of this group are allowed to access these group definition pages.)"
 => "(����� æ�� ����� ����� ������ �� æ�� ���Ҧ��� ��������� �������.)",

#: lib/FAQ/OMatic/Groups.pm:168
 "Add Group"
 => "������ �����",

#: lib/FAQ/OMatic/Groups.pm:175
 "Up To List Of Groups"
 => "������ �� ������ ����",

#: lib/FAQ/OMatic/Groups.pm:187
 "Remove Member"
 => "������ ����� �����",

#: lib/FAQ/OMatic/Groups.pm:196
 "Add Member"
 => "������ ����� �����",

#: lib/FAQ/OMatic/Groups.pm:206 lib/FAQ/OMatic/install.pm:466
#: lib/FAQ/OMatic/install.pm:470
 "Go to the Faq-O-Matic"
 => "������� �� Faq-O-Matic'�",

#: lib/FAQ/OMatic/Groups.pm:209
 "Go To Install/Configuration Page"
 => "������� �� ���Ҧ��� ��������� � ���Ʀ����æ�",

#: lib/FAQ/OMatic/Item.pm:74
 "New Item"
 => "(������� ��� �����)",

#: lib/FAQ/OMatic/Item.pm:630
 "Parts"
 => "������",

#: lib/FAQ/OMatic/Item.pm:749
 "Previous"
 => "�������Φ� ��������",

#: lib/FAQ/OMatic/Item.pm:767
 "Next"
 => "��������� ��������",

#: lib/FAQ/OMatic/Item.pm:861 lib/FAQ/OMatic/Item.pm:1268
#: lib/FAQ/OMatic/Item.pm:1452
 "Moderator"
 => "���������",

#: lib/FAQ/OMatic/Item.pm:862
 "(inherited from parent)"
 => "(�������������� צ� ����˦������� ��������)",

#: lib/FAQ/OMatic/Item.pm:876
 "Category Title and Options"
 => "��������� �� ��������� ������Ҧ�",

#: lib/FAQ/OMatic/Item.pm:877
 "Edit Category Permissions"
 => "���������� ����� ������� �� ������Ҧ�",

#: lib/FAQ/OMatic/Item.pm:878
 "Move Category"
 => "����ͦ����� ������Ҧ�",

#: lib/FAQ/OMatic/Item.pm:879
 "Trash Category"
 => "�������� ������Ҧ�",

#: lib/FAQ/OMatic/Item.pm:883
 "Answer Title and Options"
 => "��������� �� ��������� �����צĦ",

#: lib/FAQ/OMatic/Item.pm:884
 "Edit Answer Permissions"
 => "���������� ����� ������� �� �����צĦ",

#: lib/FAQ/OMatic/Item.pm:885
 "Move Answer"
 => "����ͦ����� �����צ��",

#: lib/FAQ/OMatic/Item.pm:886
 "Trash Answer"
 => "�������� �����צ��",

# Intentionally left blank.
#: lib/FAQ/OMatic/Item.pm:892
 "%0 Title and Options"
 => "",

# Intentionally left blank.
#: lib/FAQ/OMatic/Item.pm:893 lib/FAQ/OMatic/Item.pm:894
 "Edit %0 Permissions"
 => "",

# Intentionally left blank.
#: lib/FAQ/OMatic/Item.pm:895
#, c-format
 "Move %0"
 => "",

# Intentionally left blank.
#: lib/FAQ/OMatic/Item.pm:896
#, c-format
 "Trash %0"
 => "",

#: lib/FAQ/OMatic/Item.pm:934
 "Duplicate Answer"
 => "���Ц����� �����צ��",

#: lib/FAQ/OMatic/Item.pm:935
 "Duplicate Category as Answer"
 => "���Ц����� ������Ҧ� �� �����צ��",

#: lib/FAQ/OMatic/Item.pm:978
 "Convert to Answer"
 => "����������� �� �����צ��",

#: lib/FAQ/OMatic/Item.pm:988
 "Convert to Category"
 => "����������� �� ������Ҧ�",

#: lib/FAQ/OMatic/Item.pm:1004 lib/FAQ/OMatic/Item.pm:1084
 "New Answer in \"%0\""
 => "������ ���� ���� �������/�����צ�� �� \"%0\"",

#: lib/FAQ/OMatic/Item.pm:1011
 "New Subcategory of \"%0\""
 => "������ ���� ������Ҧ� �� \"%0\"",

#: lib/FAQ/OMatic/Item.pm:1037 lib/FAQ/OMatic/Part.pm:342
 "Insert Text Here"
 => "�������� ����� ����",

#: lib/FAQ/OMatic/Item.pm:1050 lib/FAQ/OMatic/Part.pm:353
 "Insert Uploaded Text Here"
 => "",

#: lib/FAQ/OMatic/Item.pm:1100
 "Append to This Answer"
 => "������ �� æ�� �����צĦ",

#: lib/FAQ/OMatic/Item.pm:1216
 "This document is:"
 => "��� ��������:",

#: lib/FAQ/OMatic/Item.pm:1218
 "This document is at:"
 => "��� �������� �������� ��:",

#: lib/FAQ/OMatic/Item.pm:1262
#, c-format
 "Group %0"
 => "����� %0",

#: lib/FAQ/OMatic/Item.pm:1266
 "Users giving their names"
 => "���������ަ, �˦ ������ ��ϧ �����",

#: lib/FAQ/OMatic/Item.pm:1267
 "Authenticated users"
 => "�������Ʀ����Φ ���������ަ",

#: lib/FAQ/OMatic/Item.pm:1282
 "New Category"
 => "���� ������Ҧ�",

#: lib/FAQ/OMatic/Item.pm:1284
 "New Answer"
 => "���� �����צ��",

#: lib/FAQ/OMatic/Item.pm:1288
 "Editing Category <b>%0</b>"
 => "����������� ������Ҧ� <b>\"%0\"</b>",

#: lib/FAQ/OMatic/Item.pm:1292
 "Editing Answer <b>%0</b>"
 => "����������� �����צĦ <b>\"%0\"</b>",

# Intentionally left blank.
#: lib/FAQ/OMatic/Item.pm:1297
 "Editing %0 <b>%1</b>"
 => "",

#: lib/FAQ/OMatic/Item.pm:1327
 "Title:"
 => "���������:",

#: lib/FAQ/OMatic/Item.pm:1332
 "<p>New Order for Text Parts:"
 => "<p>���� ����� ��� ��������� ������:",

#: lib/FAQ/OMatic/Item.pm:1344
 "Show attributions from all parts together at bottom"
 => "���������� Ц�����, ڦ���Φ � �Ӧ� ������, ����� � ���� (Show attributions from all parts together at bottom)",

#: lib/FAQ/OMatic/Item.pm:1357 lib/FAQ/OMatic/Item.pm:1511
#: lib/FAQ/OMatic/Part.pm:556 lib/FAQ/OMatic/editBag.pm:118
 "Submit Changes"
 => "������ �ͦ��",

#: lib/FAQ/OMatic/Item.pm:1358 lib/FAQ/OMatic/Item.pm:1512
#: lib/FAQ/OMatic/Part.pm:557 lib/FAQ/OMatic/editBag.pm:119
 "Revert"
 => "���������",

#: lib/FAQ/OMatic/Item.pm:1378
 "Who can add a new text part to this item:"
 => "��� ��� ����� �������� ��צ ������צ ������ �� ����� ��������:",

#: lib/FAQ/OMatic/Item.pm:1380
 "Who can add a new answer or category to this category:"
 => "��� ��� ����� �������� ��צ צ���צĦ ��� ������Ҧ� �� æ�� ������Ҧ�:",

#: lib/FAQ/OMatic/Item.pm:1382
 "Who can edit or remove existing text parts from this item:"
 => "��� ��� ����� ���������� ��� ������� �����ަ ������צ ������ � ����� ������Ԧ:",

#: lib/FAQ/OMatic/Item.pm:1384
 "Who can move answers or subcategories from this category; or turn this category into an answer or vice versa:"
 => "��� ��� ����� ����ͦ������ צ���צĦ ��� Ц�������Ҧ� �� æ�� ������Ҧ�; ��� \"�������������\" �� ������Ҧ� �� צ���צ�� � �������:",

#: lib/FAQ/OMatic/Item.pm:1386
 "Who can edit the title and options of this answer or category:"
 => "��� ��� ����� ���������� ��������� �� �ͦ������ ��������� æ�� צ���צĦ ��� ������Ҧ�:",

#: lib/FAQ/OMatic/Item.pm:1388
 "Who can use untranslated HTML when editing the text of this answer or category:"
 => "��� ��� ����� ��������������� \"������\" HTML ��� ���������Φ ������ æ�� צ���צĦ ��� ������Ҧ�:",

#: lib/FAQ/OMatic/Item.pm:1390
 "Who can change these moderator options and permissions:"
 => "��� ��� ����� �ͦ������ æ ��������� �� ����� ������� ����������:",

#: lib/FAQ/OMatic/Item.pm:1392
 "Who can create new bags:"
 => "��� ��� ����� ���������� ��צ \"ͦ���\":",

#: lib/FAQ/OMatic/Item.pm:1394
 "Who can replace existing bags:"
 => "��� ��� ����� ��ͦ������ �����ަ \"ͦ���\":",

#: lib/FAQ/OMatic/Item.pm:1396
 "Who can access the installation/configuration page (use caution!):"
 => "��� ��� ������ �� ���Ҧ��� ��������� �� ��������� (�������������� � ������Φ���!):",

#: lib/FAQ/OMatic/Item.pm:1398
 "Who can use the group membership pages:"
 => "��� ��� ����� ������������� ���Ҧ����� �������� � ������:",

#: lib/FAQ/OMatic/Item.pm:1415
 "Moderator options for category"
 => "��������� ���������� ��� ������Ҧ�",

#: lib/FAQ/OMatic/Item.pm:1419
 "Moderator options for answer"
 => "��������� ���������� ��� צ���צĦ",

# Intentionally left blank
#: lib/FAQ/OMatic/Item.pm:1424
 "Moderator options for"
 => "",

#: lib/FAQ/OMatic/Item.pm:1442
 "Name & Description"
 => "����� �� ����",

#: lib/FAQ/OMatic/Item.pm:1443
 "Setting"
 => "���������",

#: lib/FAQ/OMatic/Item.pm:1444
 "Setting if Inherited"
 => "��������� ���� \"�������������\"",

#: lib/FAQ/OMatic/Item.pm:1453
 "(will inherit if empty)"
 => "(���� �����������, ���� �������� ������)",

#: lib/FAQ/OMatic/Item.pm:1463
 "Send mail to the moderator when someone other than the moderator edits this item:"
 => "�������� ����� ����������, ���� ����� ����� (�� ���������), �����դ ��� �������:",

#: lib/FAQ/OMatic/Item.pm:1469
 "No"
 => "�",

#: lib/FAQ/OMatic/Item.pm:1469
 "Yes"
 => "���",

#: lib/FAQ/OMatic/Item.pm:1469 lib/FAQ/OMatic/Item.pm:1505
 "undefined"
 => "�����������",

#: lib/FAQ/OMatic/Item.pm:1474
 "Permissions"
 => "����� �������",

#: lib/FAQ/OMatic/Item.pm:1496
 "Blah blah"
 => "���� ���� ���� ;-)",

#: lib/FAQ/OMatic/Item.pm:1500 lib/FAQ/OMatic/Item.pm:1504
 "Relax"
 => "",

#: lib/FAQ/OMatic/Item.pm:1500 lib/FAQ/OMatic/Item.pm:1504
 "Don't Relax"
 => "",

#: lib/FAQ/OMatic/Item.pm:1500
 "Inherit"
 => "�������������",

#: lib/FAQ/OMatic/Item.pm:1534 lib/FAQ/OMatic/Item.pm:1548
 "(system default)"
 => "(��������� ��-����������)",

#: lib/FAQ/OMatic/Item.pm:1540
 "defined in"
 => "�������� �",

#: lib/FAQ/OMatic/Item.pm:1617
#, c-format
 "File %0 seems broken."
 => "���� %0 ��� ������ ������������.",

#: lib/FAQ/OMatic/Item.pm:1886
 "Category"
 => "������Ҧ�",

#: lib/FAQ/OMatic/Item.pm:1887
 "Answer"
 => "�����צ��",

#: lib/FAQ/OMatic/Item.pm:1957
 "Either someone has changed the answer or category you were editing since you received the editing form, or you submitted the same form twice"
 => "��� ����� �ͦ��� צ���צ�� ��� ������Ҧ�, ��� �� ���������� Ц��� ����, �� �� ������ ����������� �����; ��� �� ��Ħ����� ���� � ��� ���� ����� �צަ.",

#: lib/FAQ/OMatic/Item.pm:1959
 "Please %0 and start again to make sure no changes are lost. Sorry for the inconvenience."
 => "������ �����צ, %0 � ������� � �������, ��� ���� ���������, �� �ͦ�� �� ����������.  ��������� �� ������Φ���.",

#: lib/FAQ/OMatic/Item.pm:1962
 "(Sequence number in form: %0; in item: %1)"
 => "(���̦������ ����� � ���ͦ: %0; � ������Ԧ: %1)",

#: lib/FAQ/OMatic/Part.pm:266
 "Edit This Text"
 => "���������� ��� �����",

#: lib/FAQ/OMatic/Part.pm:277
 "Duplicate This Text"
 => "���Ц����� ��� �����",

#: lib/FAQ/OMatic/Part.pm:288 lib/FAQ/OMatic/Part.pm:301
 "Remove This Text"
 => "������ ��� �����",

#: lib/FAQ/OMatic/Part.pm:313
 "Replace %0 with new upload"
 => "",

#: lib/FAQ/OMatic/Part.pm:320
 "Select bag to replace with new upload"
 => "",

#: lib/FAQ/OMatic/Part.pm:329
 "Upload New Bag Here"
 => "",

#: lib/FAQ/OMatic/Part.pm:494
 "Upload file:"
 => "",

#: lib/FAQ/OMatic/Part.pm:499
 "Warning: file contents will <b>replace</b> previous text"
 => "������������: �ͦ�� ����� <b>��ͦ����</b> �������Φ� �����",

#: lib/FAQ/OMatic/Part.pm:506
 "Hide Attributions"
 => "������� Ц�����",

#: lib/FAQ/OMatic/Part.pm:509
 "Format text as:"
 => "����������� ����� ��:",

#: lib/FAQ/OMatic/Part.pm:519
 "Directory"
 => "�������",

#: lib/FAQ/OMatic/Part.pm:526
 "Natural text"
 => "��������� �����",

#: lib/FAQ/OMatic/Part.pm:530
 "Monospaced text (code, tables)"
 => "������Ҧ���� ����� (���, �����æ)",

#: lib/FAQ/OMatic/Part.pm:545
 "Untranslated HTML"
 => "\"������\" HTML",

#: lib/FAQ/OMatic/Part.pm:695 lib/FAQ/OMatic/addItem.pm:85
#: lib/FAQ/OMatic/install.pm:1138 lib/FAQ/OMatic/submitAnsToCat.pm:67
 "Answers in this category:"
 => "�����צĦ � æ� ������Ҧ�:",

#: lib/FAQ/OMatic/Slow.pm:137
 "This page will reload every %0 seconds, showing the last %1 lines of the process output."
 => "�� ���Ҧ��� ���� ����������� צ������������ ���Φ %0 ������, ��������� �����Φ %1 ����� ������ �������.",

#: lib/FAQ/OMatic/Slow.pm:141
 "Show the entire process log"
 => "�������� ����� ������� æ����",

#: lib/FAQ/OMatic/addItem.pm:48 lib/FAQ/OMatic/delPart.pm:47
#: lib/FAQ/OMatic/editItem.pm:50 lib/FAQ/OMatic/editModOptions.pm:50
#: lib/FAQ/OMatic/faq.pm:74 lib/FAQ/OMatic/moveItem.pm:50
#: lib/FAQ/OMatic/selectBag.pm:60 lib/FAQ/OMatic/submitAnsToCat.pm:49
#: lib/FAQ/OMatic/submitCatToAns.pm:48 lib/FAQ/OMatic/submitItem.pm:48
#: lib/FAQ/OMatic/submitModOptions.pm:46 lib/FAQ/OMatic/submitPart.pm:47
 "The file (%0) doesn't exist."
 => "���� (%0) �� ���դ.",

#: lib/FAQ/OMatic/addItem.pm:67
 "Copy of"
 => "��Ц�",

#: lib/FAQ/OMatic/addItem.pm:85 lib/FAQ/OMatic/install.pm:1138
#: lib/FAQ/OMatic/submitAnsToCat.pm:67
 "Subcategories:"
 => "��������Ҧ�:",

#: lib/FAQ/OMatic/appearanceForm.pm:46
 "Appearance Options"
 => "��������� ���Φ������ �������",

#: lib/FAQ/OMatic/appearanceForm.pm:60 lib/FAQ/OMatic/appearanceForm.pm:64
#: lib/FAQ/OMatic/appearanceForm.pm:68 lib/FAQ/OMatic/appearanceForm.pm:84
#: lib/FAQ/OMatic/appearanceForm.pm:92
 "Show"
 => "��������",

#: lib/FAQ/OMatic/appearanceForm.pm:60
 "Compact"
 => "���������",

#: lib/FAQ/OMatic/appearanceForm.pm:60 lib/FAQ/OMatic/appearanceForm.pm:64
#: lib/FAQ/OMatic/appearanceForm.pm:68 lib/FAQ/OMatic/appearanceForm.pm:84
#: lib/FAQ/OMatic/appearanceForm.pm:92
 "Hide"
 => "�������",

#: lib/FAQ/OMatic/appearanceForm.pm:62 lib/FAQ/OMatic/install.pm:776
 "expert editing commands"
 => "������Φ ������� �����������",

#: lib/FAQ/OMatic/appearanceForm.pm:66 lib/FAQ/OMatic/install.pm:781
 "name of moderator who organizes current category"
 => "��'� ����������, ��������� æ�� ������Ҧ��",

#: lib/FAQ/OMatic/appearanceForm.pm:70 lib/FAQ/OMatic/install.pm:786
 "last modified date"
 => "���� �������ϧ �ͦ��",

#: lib/FAQ/OMatic/appearanceForm.pm:84
 "Default"
 => "�� ����������",

#: lib/FAQ/OMatic/appearanceForm.pm:86 lib/FAQ/OMatic/install.pm:791
 "attributions"
 => "Ц�����",

#: lib/FAQ/OMatic/appearanceForm.pm:88
 "Simple"
 => "�������",

#: lib/FAQ/OMatic/appearanceForm.pm:88
 "Fancy"
 => "����������",

#: lib/FAQ/OMatic/appearanceForm.pm:94 lib/FAQ/OMatic/install.pm:796
 "commands for generating text output"
 => "������� ��� ������æ� ���������� ������",

#: lib/FAQ/OMatic/appearanceForm.pm:126
 "Accept"
 => "��������",

#: lib/FAQ/OMatic/authenticate.pm:55
 "Set a New Password"
 => "���������� ����� ������",

#: lib/FAQ/OMatic/authenticate.pm:60
 "Create a New Login"
 => "�������� ����� �Ȧ�",

#: lib/FAQ/OMatic/authenticate.pm:63
 "That password is invalid. If you've forgotten your old password, you can"
 => "��� ������ �� � ����������. ���� �� ������ �צ� ������ ������, �� ����� �����צ���",

#: lib/FAQ/OMatic/authenticate.pm:81
#, c-format
 "New items can only be added by %0."
 => "�������� ��צ �������� ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:83
#, c-format
 "New text parts can only be added by %0."
 => "�������� ��צ ������צ ������ ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:85
#, c-format
 "Text parts can only be removed by %0."
 => "������� ������צ ������ ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:89
 "This part contains raw HTML. To avoid pages with invalid HTML, the moderator has specified that only %0 can edit HTML parts. If you are %0 you may authenticate yourself with this form."
 => "�� ������ ͦ����� &quot;������&quot; HTML.  ��� ����¦��� ���צ ���Ҧ���, ͦ������ ������������ HTML, ��������� ��������, �� ���������� HTML ������ ����� ����� ����: %0.  ���� �� � �� �����, �� ����� Ц��������� ���� ����� �� ��������� �������ϧ �����.",

#: lib/FAQ/OMatic/authenticate.pm:91
#, c-format
 "Text parts can only be added by %0."
 => "�������� ������צ ������ ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:93
#, c-format
 "Text parts can only be edited by %0."
 => "���������� ������צ ������ ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:96
#, c-format
 "The title and options for this item can only be edited by %0."
 => "���������� ��������� �� ��������� ��� ����� �������� ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:98
#, c-format
 "The moderator options can only be edited by %0."
 => "���������� ��������� ���������� ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:101
 "This item can only be moved by someone who can edit both the source and destination parent items."
 => "����ͦ������ ��� ������� ��� ����� ���� ���, ��� ��� ����� ���������� ������ ����˦������ �������� (�� ��Ȧ����, ��� � æ������).",

#: lib/FAQ/OMatic/authenticate.pm:103
#, c-format
 "This item can only be moved by %0."
 => "����ͦ������ æ� ������� ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:110
#, c-format
 "Existing bags can only be replaced by %0."
 => "��ͦ������ �����ަ \"ͦ���\" ����� ����� ����: %0.",

#: lib/FAQ/OMatic/authenticate.pm:112
#, c-format
 "Bags can only be posted by %0."
 => "��������� &quot;ͦ���&quot; ����� ����� ����: %0",

#: lib/FAQ/OMatic/authenticate.pm:115
#, c-format
 "The FAQ-O-Matic can only be configured by %0."
 => "���Ʀ��������� FAQ-O-Matic ����� �����: %0.",

#: lib/FAQ/OMatic/authenticate.pm:117
 "The operation you attempted (%0) can only be done by %1."
 => "�����æ�, ��� �� ���������� �������� (%0), ����� ����� ���������� ����: %1",

#: lib/FAQ/OMatic/authenticate.pm:120
 "If you have never established a password to use with FAQ-O-Matic, you can"
 => "���� � ��� ����� ����� ����� �� FAQ-O-Matic'�, �� ����� �����צ���",

#: lib/FAQ/OMatic/authenticate.pm:121
 "If you have forgotten your password, you can"
 => "���� �� ������ �צ� ������, �� ����� �����צ���",

#: lib/FAQ/OMatic/authenticate.pm:122
 "If you have already logged in earlier today, it may be that the token I use to identify you has expired. Please log in again."
 => "���� �� �Ť���������� (�������) ������Φ, �� ����� ����� ��צ�������� �������, �� ������Ʀ����� ���ϧ ��Ӧ� ��� �����Ҧ�. ������ �����צ, ���Ť��������� �����.",

#: lib/FAQ/OMatic/authenticate.pm:136
 "Please offer one of the following forms of identification:"
 => "������ �����צ, ������� ���� � ���̦������ ���� ������Ʀ��æ�:",

#: lib/FAQ/OMatic/authenticate.pm:139
 "No authentication, but my email address is:"
 => "��� �������Ʀ��æ�, ���� email-������:",

# Intentionally left blank.
#: lib/FAQ/OMatic/authenticate.pm:140
 "Email:"
 => "",

#: lib/FAQ/OMatic/authenticate.pm:147
 "Authenticated login:"
 => "�������Ʀ������� �Ȧ�:",

#: lib/FAQ/OMatic/authenticate.pm:149 lib/FAQ/OMatic/changePass.pm:64
 "Password:"
 => "������:",

#: lib/FAQ/OMatic/changePass.pm:48
 "Please enter your username, and select a password."
 => "������ �����צ, ������� ���� �Ť����æ��� ��'� �� ������.",

#: lib/FAQ/OMatic/changePass.pm:49
 "I will send a secret number to the email address you enter to verify that it is valid."
 => "�� email-������, ��� �� �����������, ���� צ��������� �Ť���� ��� (Secret Number), ���� ��� ����������� ��� Ц�����������, �� �� email-������ ���դ � �� ���� Ħ���� ���� (���, �� �������ۤ, ����� �� �ŧ ������).",

#: lib/FAQ/OMatic/changePass.pm:50
 "If you prefer not to give your email address to this web form, please contact"
 => "���� ��� �� �� ������� ������������� ���� email-������ ����� �� �����, ������ �����צ, ��'������� �",

#: lib/FAQ/OMatic/changePass.pm:52
 "Please <b>do not</b> use a password you use anywhere else, as it will not be transferred or stored securely!"
 => "������ ����צ, <b>�� ��������������</b> ������, ���� �� ��� ����������դ�� ����-��, ��˦���� צ� <b>�� ����</b> ������������ �� ��������� ��������� ��������!",

#: lib/FAQ/OMatic/changePass.pm:66
 "Set Password"
 => "���������� ������",

#: lib/FAQ/OMatic/editBag.pm:75
 "Replace bag"
 => "��ͦ���� &quot;ͦ���&quot;",

#: lib/FAQ/OMatic/editBag.pm:81
 "Upload new bag to show in the %0 part in <b>%1</b>."
 => "",

#: lib/FAQ/OMatic/editBag.pm:97
 "Bag name:"
 => "����� &quot;ͦ���&quot;:",

#: lib/FAQ/OMatic/editBag.pm:99
 "The bag name is used as a filename, so it is restricted to only contain letters, numbers, underscores (_), hyphens (-), and periods (.). It should also carry a meaningful extension (such as .gif) so that web browsers will know what to do with the data."
 => "����� &quot;ͦ���&quot; ����������դ����, �� ��'� �����, ���� ������� ���� ���� �����, �����, ����� Ц���������� (`_'), ����� �������� (`-') �� ������ (`.').  ���� ������� ����� �������� ��������� ��������� (���������, .gif), ��� web-������� ����, �� ������ � ���� �ͦ����.",

#: lib/FAQ/OMatic/editBag.pm:102
 "Bag data:"
 => "�ͦ�� &quot;ͦ���&quot;:",

#: lib/FAQ/OMatic/editBag.pm:105
 "(Leave blank to keep original bag data and change only the associated information below.)"
 => "(������� ������, ��� �������� �ͦ�� \"ͦ���\" ���ͦ�����, � �ͦ���� ���� ��'����� � ��� �������æ�.)",

#: lib/FAQ/OMatic/editBag.pm:110
 "If this bag is an image, fill in its dimensions."
 => "���� ��� \"ͦ���\" � ���������� -- ��������� ���� ���ͦ����Ԧ.",

#: lib/FAQ/OMatic/editBag.pm:111
 "Width:"
 => "������:",

#: lib/FAQ/OMatic/editBag.pm:113
 "Height:"
 => "������:",

#: lib/FAQ/OMatic/editPart.pm:146
 "Enter the answer to <b>%0</b>"
 => "������� צ���צ�� �� ������� <b>%0</b>",

#: lib/FAQ/OMatic/editPart.pm:148
 "Enter a description for <b>%0</b>"
 => "������� ���� ��� <b>%0</b>",

#: lib/FAQ/OMatic/editPart.pm:150
 "Edit duplicated text for <b>%0</b>"
 => "����������� ���Ц�������� ������ ��� <b>%0</b>",

#: lib/FAQ/OMatic/editPart.pm:152
 "Enter new text for <b>%0</b>"
 => "������� ����� ����� ��� <b>%0</b>",

#: lib/FAQ/OMatic/editPart.pm:157
 "Editing the %0 text part in <b>%1</b>."
 => "����������� �������ϧ ������ N %0 � <b>%1</b>.",

#: lib/FAQ/OMatic/editPart.pm:171
 "If you later need to edit or delete this text, use the [Appearance] page to turn on the expert editing commands."
 => "���� ��� Ц�Φ�� ����������� צ����������� ��� ������ ��� �����, �������������� ���Ҧ��� <code>[���Φ�Φ� ������]</code> ��� �צ������ ������Φ ������� �����������.",

#: lib/FAQ/OMatic/install.pm:93
 "Faq-O-Matic Installer"
 => "���������� FAQ-O-Matic'�",

#: lib/FAQ/OMatic/install.pm:121
#, c-format
 "%0 failed: "
 => "������� Ц� ��� %0: ",

#: lib/FAQ/OMatic/install.pm:127
 "Unknown step: \"%0\"."
 => "��צ����� ����: \"%0\".",

#: lib/FAQ/OMatic/install.pm:138
 "Updating config to reflect new meta location <b>%0</b>."
 => "����������� ���Ʀ����æ� ��� צ���������� ������ ͦ�������������� �������� meta: <b>%0</b>.",

#: lib/FAQ/OMatic/install.pm:156
 "(Can't find <b>config</b> in '%0' -- assuming this is a new installation.)"
 => "(�� � ���ڦ ������ <b>config</b> � '%0' -- ���������, �� �� � ���� �������æ�.)",

#: lib/FAQ/OMatic/install.pm:180
#, c-format
 "Click here</a> to create %0."
 => "����Φ�� ����, ��� �������� %0.",

#: lib/FAQ/OMatic/install.pm:182
 "If you want to change the CGI stub to point to another directory, edit the script and then"
 => "���� �� ������� �ͦ���� CGI-������, ��� צ� �������� �� ����� �������, צ���������� ������ � Ц��� �����",

#: lib/FAQ/OMatic/install.pm:185
 "click here to use the new location"
 => "����Φ�� ����, ��� ������ ��������������� ���� ͦ��������������",

#: lib/FAQ/OMatic/install.pm:187
 "FAQ-O-Matic stores files in two main directories.<p>The <b>meta/</b> directory path is encoded in your CGI stub (%0). It contains:"
 => "FAQ-O-Matic ���Ҧ��� ����� � ���� �������� ���������. <p>���� �� �������� <b>meta/</b> �������� � ������ CGI-�����Ԧ (%0).  ��� ͦ�����:",

#: lib/FAQ/OMatic/install.pm:188
 "<ul><li>the <b>config</b> file that tells FAQ-O-Matic where everything else lives. That's why the CGI stub needs to know where meta/ is, so it can figure out the rest of its configuration. <li>the <b>idfile</b> file that lists user identities. Therefore, meta/ should not be accessible via the web server. <li>the <b>RCS/</b> subdirectory that tracks revisions to FAQ items. <li>various hint files that are used as FAQ-O-Matic runs. These can be regenerated automatically.</ul>"
 => "<ul><li>���� <b>config</b>, ���� ��צ����Ѥ FAQ-O-Matic, �� ������ ��� ����.  ����� �� CGI-������ ������� ����� �� ����������� ������� meta/, ����ަ �� צ� ���� � ���ڦ ��������� ��� ���� ���Ʀ����æ�.  <li>���� <b>idfile</b>, ���� ͦ����� ������ ������Ʀ����Ҧ� ���������ަ�.  ����� �� meta/ ������� ���� �� ��������� ����� web-������. <li>� Ц�������ڦ <b>RCS/</b> ������������ ���Ӧ� ��������� FAQ.  <li>Ҧ�����Φ�Φ �����-Ц������ (hint files), ����� ������դ���� ��������� FAQ-O-Matic.  ���� ����������� �����������.</ul>",

#: lib/FAQ/OMatic/install.pm:189
 "<p>The <b>serve/</b> directory contains three subdirectories <b>item/</b>, <b>cache/</b>, and <b>bags/</b>. These directories are created and populated by the FAQ-O-Matic CGI, but should be directly accessible via the web server (without invoking the CGI)."
 => "������� <b>serve/</b> ͦ����� ��� Ц���������: <b>item/</b>, <b>cache/</b> �� <b>bags/</b>.  � Ц��������� ����������� �� ������������ FAQ-O-Matic'��, ��� �����Φ ���� ������Φ web-�������צ ������� (��� ��������� �� CGI).",

#: lib/FAQ/OMatic/install.pm:190
 "<ul><li>serve/item/ contains only FAQ-O-Matic formatted source files, which encode both user-entered text and the hierarchical structure of the answers and categories in the FAQ. These files are only accessed through the web server (rather than the CGI) when another FAQ-O-Matic is mirroring this one. <li>serve/cache/ contains a cache of automatically-generated HTML versions of FAQ answers and categories. When possible, the CGI directs users to the cache to reduce load on the server. (CGI hits are far more expensive than regular file loads.) <li>serve/bags/ contains image files and other ``bags of bits.'' Bit-bags can be linked to or inlined into FAQ items (in the case of images). </ul>"
 => "<ul><li>serve/item/ ͦ����� ���� צ����������Φ ��Ȧ�Φ ����� ��� FAQ-O-Matic'�, �˦ ͦ����� �� ������� ������������ �����, ��� � ���� �����Ȧ��ϧ ��������� צ���צ��� �� ������Ҧ� FAQ.  ������ �� æ� ������ ��� ���� ����� web-������ (�� צ�ͦ�� צ� ������� ����� CGI) ���� ����-������ ����� FAQ-O-Matic ������ ���������� ��Ц� (mirroring) � ����� FAQ-O-Matic'a.  <li>serve/cache/ ͦ����� ��� ����������� ������������ HTML ���Ӧ� צ���צ��� �� ������Ҧ� FAQ.  ���� �������, CGI �����������Ѥ ���������ަ� �� ����� ����, ��ͦ�������, ��� �����, ������������ �� ������.  (������������ CGI ������դ �������� ¦���� �����Ӧ�, Φ� ������ צ����� ��� �������� ����.) <li>serve/bags/ ͦ����� ����� ���������, ��, ������ �������, &quot;ͦ��� � ¦����&quot; (&quot;bags of bits&quot;).  &quot;�����&quot; ������ ���� ����'���Φ �� ��� �������Φ �� (���� �� ����������) �������� FAQ. </ul>",

#: lib/FAQ/OMatic/install.pm:202 lib/FAQ/OMatic/install.pm:217
#: lib/FAQ/OMatic/install.pm:276 lib/FAQ/OMatic/install.pm:612
 "I couldn't create <b>%0</b>: %1"
 => "�� ������� �������� <b>%0</b>: %1",

#: lib/FAQ/OMatic/install.pm:206 lib/FAQ/OMatic/install.pm:221
#: lib/FAQ/OMatic/install.pm:615
 "Created <b>%0</b>."
 => "�������� <b>%0</b>.",

#: lib/FAQ/OMatic/install.pm:209 lib/FAQ/OMatic/install.pm:224
#: lib/FAQ/OMatic/install.pm:618
 "I don't have write permission to <b>%0</b>."
 => "����� ���� �� ����� �� <b>%0</b>.",

#: lib/FAQ/OMatic/install.pm:268
 "Created new config file."
 => "�������� ����� ���Ʀ����æ���� ����.",

#: lib/FAQ/OMatic/install.pm:282
 "The idfile exists."
 => "���� <code>idfile</code> ��� ���դ.",

#: lib/FAQ/OMatic/install.pm:331
 "Configuration Main Menu (install module)"
 => "���Ʀ����æ�, ������� ���� (������ �������æ�)",

#: lib/FAQ/OMatic/install.pm:332
 "Perform these tasks in order to prepare your FAQ-O-Matic version %0:"
 => "��������� æ ����ަ ��� Ц�������� ������ FAQ-O-Matic'� ���Ӧ� %0:",

#: lib/FAQ/OMatic/install.pm:337
 "Define configuration parameters"
 => "��������� ���Ʀ����æ�Φ ���������",

#: lib/FAQ/OMatic/install.pm:342 lib/FAQ/OMatic/install.pm:347
 "Set your password and turn on installer security"
 => "���������� ��� ������ � �צ������ ������� �����������",

#: lib/FAQ/OMatic/install.pm:348
 "(Need to configure \$mailCommand and \$adminAuth)"
 => "(����Ȧ��� ����Ʀ�������� \$mailCommand � \$adminAuth)",

#: lib/FAQ/OMatic/install.pm:354
 "(Installer security is on)"
 => "(������� ����������� �צ������)",

#: lib/FAQ/OMatic/install.pm:359
 "Create item, cache, and bags directories in serve dir"
 => "������� item, cache, � bags Ц��������� � ������ڦ serve",

#: lib/FAQ/OMatic/install.pm:367
 "Copy old items</a> from <tt>%0</tt> to <tt>%1</tt>."
 => "��Ц����� ���Ҧ �������� � <tt>%0</tt> �� <tt>%1</tt>.",

#: lib/FAQ/OMatic/install.pm:374
 "Install any new items that come with the system"
 => "��������� �Ӧ ��צ ��������, �� ����� ����� �� ��������.",

#: lib/FAQ/OMatic/install.pm:379
 "Create system default items"
 => "������� ������Φ �������� ��-����������",

#: lib/FAQ/OMatic/install.pm:387 lib/FAQ/OMatic/install.pm:498
 "Rebuild the cache and dependency files"
 => "����������� ���-����� �� ����� �����������",

#: lib/FAQ/OMatic/install.pm:394
 "Install system images and icons"
 => "���������� ������Φ ���������� �� ������",

#: lib/FAQ/OMatic/install.pm:402
 "Update mirror from master now. (this can be slow!)"
 => "",

#: lib/FAQ/OMatic/install.pm:408
 "Set up the maintenance cron job"
 => "",

#: lib/FAQ/OMatic/install.pm:414 lib/FAQ/OMatic/install.pm:419
 "Run maintenance script manually now"
 => "�������� ������������� ������ ������, �����",

#: lib/FAQ/OMatic/install.pm:421
 "(Need to set up the maintenance cron job first)"
 => "(����Ȧ��� �������� ���������� ������������ cron-������)",

#: lib/FAQ/OMatic/install.pm:429
 "Maintenance last run at:"
 => "������������ ������ ������������ � �����Τ:",

#: lib/FAQ/OMatic/install.pm:434
#, c-format
 "Mark the config file as upgraded to Version %0"
 => "��������� ���Ʀ����æ���� ����, �� ��������� �� ���Ӧ� %0",

#: lib/FAQ/OMatic/install.pm:440
 "Select custom colors for your Faq-O-Matic</a> (optional)"
 => "�ͦ���� ������� ������ FAQ-O-Matic'�</a> (�� ����'�������)",

#: lib/FAQ/OMatic/install.pm:444
 "Define groups</a> (optional)"
 => "��������� �����</a> (�� ����'�������)",

#: lib/FAQ/OMatic/install.pm:450
 "Upgrade to CGI.pm version 2.49 or newer."
 => "��������� CGI.pm �� ���Ӧ� 2.49 ��� ��צ�ϧ.",

#: lib/FAQ/OMatic/install.pm:453
 "(optional; older versions have bugs that affect bags)"
 => "(�� ����'�������; ���Ҧ ���Ӧ� ����� �������, ��� ������ &quot;ͦ���&quot; �� �������������)",

#: lib/FAQ/OMatic/install.pm:456
#, c-format
 "You are using version %0 now."
 => "�� ����� ����������դ�� ���Ӧ� %0.",

#: lib/FAQ/OMatic/install.pm:461
 "Bookmark this link to be able to return to this menu."
 => "������� �������� �� æ�� ���Ҧ���, ��� ��������� ���������� �� ����� ���� (������ �� �� �Ӧ� ���������).",

#: lib/FAQ/OMatic/install.pm:472
 "(need to turn on installer security)"
 => "(����Ȧ���, ���� �צ������ ������� �����������)",

#: lib/FAQ/OMatic/install.pm:475
 "Other available tasks:"
 => "��ۦ ������Φ ��������:",

#: lib/FAQ/OMatic/install.pm:479
 "See access statistics"
 => "���������� ���������� �������",

#: lib/FAQ/OMatic/install.pm:484
 "Examine all bags"
 => "����צ���� �Ӧ \"ͦ���\"",

#: lib/FAQ/OMatic/install.pm:490
 "Check for unreferenced bags (not linked by any FAQ item)"
 => "����צ���� �� \"Ц�צ��Φ ͦ���\" (\"ͦ���\", �� �˦ ����� �������� Φ � ������� �������� FAQ)",

#: lib/FAQ/OMatic/install.pm:503
#, c-format
 "The Faq-O-Matic modules are version %0."
 => "����̦ FAQ-O-Matic ����� ���Ӧ� %0.",

# HERE
# Russian
#: lib/FAQ/OMatic/install.pm:622
 "I wasn't able to change the permissions on <b>%0</b> to 755 (readable/searchable by all)."
 => "[R] �� ������� �������� ����� ������� � <b>%0</b> �� 755 (������/����� ��� ����).",

#: lib/FAQ/OMatic/install.pm:637 lib/FAQ/OMatic/install.pm:638
 "updated config file:"
 => "��������� ���� ���Ʀ����æ�:",

# Russian
#: lib/FAQ/OMatic/install.pm:645
 "Redefine configuration parameters to ensure that <b>%0</b> is valid."
 => "[R] �������������� (���������� ������?) ���������������� ���������, ���� ���� ���������, ��� <b>%0</b> � �������.",

# Intentionally left blank.
#: lib/FAQ/OMatic/install.pm:657
 "Jon made a mistake here; key=%0, property=%1."
 => "",

#: lib/FAQ/OMatic/install.pm:686
 "<b>Mandatory:</b> System information"
 => "<b>����'�������:</b> �������æ� ��� �������",

# Russian
#: lib/FAQ/OMatic/install.pm:689
 "Identity of local FAQ-O-Matic administrator (an email address)"
 => "[R] ������������� ���������� �������������� FAQ-O-Matic (email-�����)",

# Russian
#: lib/FAQ/OMatic/install.pm:691
 "A command FAQ-O-Matic can use to send mail. It must either be sendmail, or it must understand the -s (Subject) switch."
 => "[R] �������, ������������ FAQ-O-Matic'�� ��� �������� �����.  ��� ������ ���� sendmail ��� ���-������ ������, ��� �������� ����� -s (Subject).",

# Russian
#: lib/FAQ/OMatic/install.pm:693
 "The command FAQ-O-Matic can use to install a cron job."
 => "[R] �������, ������� FAQ-O-Matic ����� ������������ ��� ��������� cron job.",

# Russian
#: lib/FAQ/OMatic/install.pm:696
 "Path to the <b>ci</b> command from the RCS package."
 => "[R] ���� � ������� <b>ci</b> �� ������ RCS.",

#: lib/FAQ/OMatic/install.pm:699
 "<b>Mandatory:</b> Server directory configuration"
 => "<b>����'�������:</b> ���Ʀ����æ� ������Ǧ� �������",

#: lib/FAQ/OMatic/install.pm:701
 "Protocol, host, and port parts of the URL to your site. This will be used to construct link URLs. Omit the trailing '/'; for example: <tt>http://www.dartmouth.edu</tt>"
 => "��������-, ����- � ����-������� URL, �� ����դ �� ��� ����.  ���� ������ ����������������� ��� ��������� URL � ����������.  �� ������������� ˦������ '/'; �������: <tt>http://www.dartmouth.edu</tt>",

#: lib/FAQ/OMatic/install.pm:704
 "The path part of the URL used to access this CGI script, beginning with '/' and omitting any parameters after the '?'. For example: <tt>/cgi-bin/cgiwrap/jonh/faq.pl</tt>"
 => "������� URL, צ���צ������ �� ���� �� ����� CGI-�������.  ������� ���������� � '/' � �� ͦ����� Φ���� �������Ҧ� Ц��� '?'.  �������: <tt>/cgi-bin/cgiwrap/jonh/faq.pl</tt>",

# Russian
#: lib/FAQ/OMatic/install.pm:707
 "Filesystem directory where FAQ-O-Matic will keep item files, image and other bit-bag files, and a cache of generated HTML files. This directory must be accessible directly via the http server. It might be something like /home/faqomatic/public_html/fom-serve/"
 => "[R] ������� � �������� �������, ��� FAQ-O-Matic ������ ����� ���������, ����������� � ������ \"����� � ������\", � ��� �� �������� ��������������� HTML �����.  ���� ������� ������ ���� �������� �������� ����� web-������.  ��� ����� ���� ���-������ ��������� <code>/home/faqomatic/public_html/fom-serve/</code>",

# Russian
#: lib/FAQ/OMatic/install.pm:709
 "The path prefix of the URL needed to access files in <b>\$serveDir</b>. It should be relative to the root of the server (omit http://hostname:port, but include a leading '/'). It should also end with a '/'."
 => "[R] ������� ���� � URL, ����������� ��� ������� � ������, ������������� � <b>\$serveDir</b>.  �� ������ ���� ����� ��������� �������� ������� (������� http://hostname:port, �� ������� ���������� '/').  �� ������, �����, ����������� �� '/'.",

# ? ���������
#: lib/FAQ/OMatic/install.pm:712
 "<i>Optional:</i> Miscellaneous configurations"
 => "<i>�� ����'�������:</i> ���Φ�Φ ���������",

# Russian
#: lib/FAQ/OMatic/install.pm:717
 "Select the display language."
 => "[R] �������� ���� ��� �����������. (Select the display language.)",

# Russian
#: lib/FAQ/OMatic/install.pm:722
 "Show dates in 24-hour time or am/pm format."
 => "[R] ���������� ���� � 24-������� �������, ��� � ������� am/pm.",

# Russian
#: lib/FAQ/OMatic/install.pm:726
 "If this parameter is set, this FAQ will become a mirror of the one at the given URL. The URL should be the base name of the CGI script of the master FAQ-O-Matic."
 => "[R] ���� ���� �������� ����������, �� ���� FAQ ������ ���������� ������ (mirror) FAQ, ������������ �� ���������� URL.  URL ������ ���� ������� ������ (base name) CGI-������� &quot;��������&quot; FAQ-O-Matic'�.",

# Russian
#: lib/FAQ/OMatic/install.pm:728
 "An HTML fragment inserted at the top of each page. You might use this to place a corporate logo."
 => "[R] HTML ��������, ������� ����������� � ������ ������ ��������.  �� ������ ������������ ���, ��������, ��� ���������� ������ ��������.",

# Russian
#: lib/FAQ/OMatic/install.pm:730 lib/FAQ/OMatic/install.pm:743
 "If this field begins with <tt>file=</tt>, the text will come from the named file in the meta directory; otherwise, this field is included verbatim."
 => "[R] ���� ���������� ����� ���� ���������� � <tt>file=</tt>, �� ����� ����� ���� �� ���������� ����� � �������� meta; � ��������� ������ ���������� ���� ����� ��������� &quot;��� ����&quot;.",

# Russian
#: lib/FAQ/OMatic/install.pm:738
 "The <tt>width=</tt> tag in a table. If your <b>\$pageHeader</b> has <tt>align=left</tt>, you will want to make this empty."
 => "[R] ��� <tt>width=</tt> � �������.  ���� ��� <b>\$pageHeader</b> ����� <tt>align=left</tt>, ��, ��������, ��������� �������� ��� ������.",

# Russian
#: lib/FAQ/OMatic/install.pm:741
 "An HTML fragment appended to the bottom of each page. You might use this to identify the webmaster for this site."
 => "[R] HTML ��������, ������� ����������� � ����� ������ ��������.  �� ������ ������������ ���, ��������, ��� ���������, ��� ���� webmaster ������ �����.",

# Russian
#: lib/FAQ/OMatic/install.pm:746
 "Where FAQ-O-Matic should send email when it wants to alert the administrator (usually same as \$adminAuth)"
 => "[R] ���� FAQ-O-Matic ������ �������� email, ����� �� ����� �������� �������� �������������� (������, ���� �����, ��� � \$adminAuth)",

# Russian
#: lib/FAQ/OMatic/install.pm:748
 "If true, FAQ-O-Matic will mail the log file to the administrator whenever it is truncated."
 => "[R] ���� 'true', �� FAQ-O-Matic ����� �������� log-���� �������������� ������ ��� ��� ��� ��������.",

# Russian
#: lib/FAQ/OMatic/install.pm:751
 "User to use for RCS ci command (default is process UID)"
 => "[R] ������������, ������������ ��� RCS-������� <code>ci</code> (��-���������: UID ��������)",

# Russian
#: lib/FAQ/OMatic/install.pm:755
 "Links from cache to CGI are relative to the server root, rather than absolute URLs including hostname:"
 => "[R] ������������ � ���� ������������� ������ �� CGI (������������ ��������� �������� �������), ������ ���������� URL, ���������� ��� �����:",

# Russian
#: lib/FAQ/OMatic/install.pm:759
 "mailto: links can be rewritten such as jonhATdartmouthDOTedu (cheesy), jonh (nameonly), or e-mail addresses suppressed entirely (hide)."
 => "[R] ��� ������ �� spam'�, ������ <code>mailto:</code> ����� ���������� �� ���� jonhATdartmouthDOTedu (cheesy), jonh (nameonly), ��� email-����� ����� ���� ����� ������ (hide).  'off' �������� �� �������� ������ <code>mailto:</code>.",

# Russian
#: lib/FAQ/OMatic/install.pm:763
 "Number of seconds that authentication cookies remain valid. These cookies are stored in URLs, and so can be retrieved from a browser history file. Hence they should usually time-out fairly quickly."
 => "[R] ���������� ������, � ������� ������� ������������������ &quot;������&quot; (cookies) �������� ���������������.  ��� &quot;������&quot; ����������� � URL, �, �������������, ����� ���� ��������� �� ����� ������� �������� (browser history file).  ������ ��� �������� ������ ���� ���������� ���������.",

# Russian
#: lib/FAQ/OMatic/install.pm:766
 "<i>Optional:</i> These options set the default [Appearance] modes."
 => "[R] <i>�� ����'�������:</i> ��� ��������� ����������, ����� ����� <code>[���Φ�Φ� ������]</code> �� ���������.",

# Russian
#: lib/FAQ/OMatic/install.pm:771
 "Page rendering scheme. Do not choose 'text' as the default."
 => "[R] ����� ��������� �������.  �� ����������� 'text', � �������� ����� ��-���������.",

# Russian
#: lib/FAQ/OMatic/install.pm:799
 "<i>Optional:</i> These options fine-tune the appearance of editing features."
 => "[R] <i>�� ����'�������:</i> &quot;������&quot; ��������� ���� ������ ��������������.",

# Russian
#: lib/FAQ/OMatic/install.pm:802
 "The old [Show Edit Commands] button appears in the navigation bar."
 => "[R] ������ ������ <code>[�������� ������� ��������������]</code> ������ � ������������� �������.",

# Russian
#: lib/FAQ/OMatic/install.pm:806
 "Navigation links appear at top of page as well as at the bottom."
 => "[R] ���������� ������������� ������ ������ ��������, ��� ��, ��� � �����.",

#: lib/FAQ/OMatic/install.pm:810
 "Hide [Append to This Answer] and [Add New Answer in ...] buttons."
 => "������� ������ <code>[������ �� 㦤� �����צĦ]</code> �� <code>[���� �����צ�� � ...]</code>",

# Russian
#: lib/FAQ/OMatic/install.pm:815
 "Editing commands appear with neat-o icons rather than [In Brackets]."
 => "[R] ������� �������������� ������������ ������ � ��������, � �� <code>[� ���������� �������]</code>.",

# Russian
#: lib/FAQ/OMatic/install.pm:818
 "<i>Optional:</i> Other configurations that you should probably ignore if present."
 => "[R] <i>�� ����'�������:</i> ������ ���������, ������� ��, ��������, �������� ���������������.",

#: lib/FAQ/OMatic/install.pm:822
 "Draw Item titles John Nolan's way."
 => "",

# Russian
#: lib/FAQ/OMatic/install.pm:826
 "Hide sibling (Previous, Next) links"
 => "[R] �������� ������ �� ���������� � ��������� ���������",

# Russian
#: lib/FAQ/OMatic/install.pm:830
 "Use DBM-based search databases. Faster on machines with non-broken DBM."
 => "[R] ������������ ��������� ������, ���������� �� DBM.  �� �������, �� �� ������ ������ ����� �������������� (����������) DBM.",

# Russian
#: lib/FAQ/OMatic/install.pm:937
 "This is a command, so only letters, hyphens, and slashes are allowed."
 => "[R] ��� �������, ������ ����������� ������ �����, ����� �������� ('-') � ����� ('/').",

# Russian
#: lib/FAQ/OMatic/install.pm:996
 "If this is your first time installing a FAQ-O-Matic, I recommend only filling in the sections marked <b>Mandatory</b>."
 => "[R] ���� �� �������������� FAQ-O-Matic � ������ ���, ����������� ��������� ������ ������, �������������, ��� <b>������������</b> (<b>Mandatory</b>).",

#: lib/FAQ/OMatic/install.pm:1000
 "Define"
 => "����������",

# Russian
#: lib/FAQ/OMatic/install.pm:1041
 "You should <a href=\"%0\">go back</a> and fix these configurations."
 => "[R] �� ������ <a href=\"%0\">���������</a> � ��������� ��� ���������.",

#: lib/FAQ/OMatic/install.pm:1044
 "Rewrote configuration file."
 => "���Ʀ����æ���� ���� ����������.",

# Russian
#: lib/FAQ/OMatic/install.pm:1058
 "%0 (%1) has an internal apostrophe, which will certainly make Perl choke on the config file."
 => "[R] %0 (%1) �������� ��������, ������� ����� ���� ����������� ��������� Perl'�� ������ ����������������� �����.",

# Russian
#: lib/FAQ/OMatic/install.pm:1062 lib/FAQ/OMatic/install.pm:1068
 "%0 (%1) doesn't look like a fully-qualified email address."
 => "[R] %0 (%1) �� ��������, ��� ������ email-�����.",

# Russian
#: lib/FAQ/OMatic/install.pm:1074 lib/FAQ/OMatic/install.pm:1079
 "%0 (%1) isn't executable."
 => "[R] %0 (%1) �� �������� ���������� ������.",

# Russian
#: lib/FAQ/OMatic/install.pm:1096
 "%0 has funny characters."
 => "[R] %0 ����� \"�������\" �������.",

# Russian
#: lib/FAQ/OMatic/install.pm:1125
 "Untitled Faq-O-Matic"
 => "[R] ���������� Faq-O-Matic",

# Russian
#: lib/FAQ/OMatic/install.pm:1131
 "To name your FAQ-O-Matic, use the [Appearance] page to show the expert editing commands, then click [Edit Category Title and Options]."
 => "[R] ���� ������� ��� FAQ-O-Matic, ����������� �������� [���Φ�Φ� ������] � ��������� �� ��� ����������� ������� ��������������, ����� ���� ������� [��������� � ��������� ���������]",

#: lib/FAQ/OMatic/install.pm:1141 lib/FAQ/OMatic/install.pm:1153
#: lib/FAQ/OMatic/install.pm:1165
 "Created category \"%0\"."
 => "������� ������Ҧ� \"%0\".",

# Russian
#: lib/FAQ/OMatic/install.pm:1143 lib/FAQ/OMatic/install.pm:1155
#: lib/FAQ/OMatic/install.pm:1167
 "<b>%0</b> already contains a file '%1'."
 => "[R] <b>%0</b> ��� �������� ���� '%1'.",

# Russian
#: lib/FAQ/OMatic/install.pm:1205
 "Copied %0 items from <tt>%1</tt> to <tt>%2</tt>."
 => "[R] ����������� %0 ��������� �� <tt>%1</tt> � <tt>%2</tt>.",

# Russian
#: lib/FAQ/OMatic/install.pm:1262
 "Attempting to install cron job:"
 => "[R] ������� ���������� cron job:",

# Russian
#: lib/FAQ/OMatic/install.pm:1310
 "I replaced this old crontab line, which appears to be an older one for this same FAQ:"
 => "[R] ���� �������� ������ ������ � ����� crontab, ������� ���������� � ����� �� FAQ (��� ���� ����� �� ��� ������)",

#: lib/FAQ/OMatic/install.pm:1319
 "I thought I installed a new cron job, but it didn't appear to take."
 => "",

# Russian
#: lib/FAQ/OMatic/install.pm:1321
 "You better add %0 to some crontab yourself with <b><tt>crontab -e</tt></b>"
 => "[R] ��� ����� �������� \`%0' � �����-������ crontab ����� � ������� ������� <b><tt>crontab -e</tt></b>",

#: lib/FAQ/OMatic/install.pm:1327
 "Cron job installed. The maintenance script should run hourly."
 => "",

# Russian
#: lib/FAQ/OMatic/install.pm:1383
 "Use the <u>%0</u> links to change the color of a feature."
 => "[R] ����������� ������ <u>%0</u>, ����� �������� ��������������� ����.",

# Russian
#: lib/FAQ/OMatic/install.pm:1397
 "An Item Title"
 => "[R] ��������� ��������",

# Russian
#: lib/FAQ/OMatic/install.pm:1405
 "A regular part is how most of your content will appear. The text colors should be most pleasantly readable on this background."
 => "[R] ������� ��������� �����.  ����� ��� ���������� FAQ ������������� ������ � ���.  ����� ������ ������ ���� ��������� ���, ����� ���� �������� ����������� ��� ������.",

# Russian
#: lib/FAQ/OMatic/install.pm:1407 lib/FAQ/OMatic/install.pm:1419
#: lib/FAQ/OMatic/install.pm:1446
 "A new link"
 => "[R] ����� ������",

# Russian
#: lib/FAQ/OMatic/install.pm:1408 lib/FAQ/OMatic/install.pm:1420
#: lib/FAQ/OMatic/install.pm:1450
 "A visited link"
 => "[R] ���������� ������",

#: lib/FAQ/OMatic/install.pm:1410 lib/FAQ/OMatic/install.pm:1422
#: lib/FAQ/OMatic/install.pm:1455
 "A search hit"
 => "&quot;���������&quot; ������",

# Russian
#: lib/FAQ/OMatic/install.pm:1418
 "A directory part should stand out"
 => "[R] �����-�������.  ��� ������ ����������.",

#: lib/FAQ/OMatic/install.pm:1442
 "Regular text"
 => "��������� �����",

# Russian
#: lib/FAQ/OMatic/install.pm:1467
 "Select a color for %0:"
 => "[R] �������� ���� ��� &quot;%0&quot;",

# Russian
#: lib/FAQ/OMatic/install.pm:1478
 "Or enter an HTML color specification manually:"
 => "[R] ��� ������� HTML-������������ ����� �������:",

#: lib/FAQ/OMatic/install.pm:1481
 "Select"
 => "�������",

# Russian
#: lib/FAQ/OMatic/install.pm:1490
 "Unrecognized config parameter"
 => "[R] �������������� ���������������� ��������",

#: lib/FAQ/OMatic/install.pm:1538
#, c-format
 "Proceed to step '%0'"
 => "������ �� ����� '%0'",

#: lib/FAQ/OMatic/moveItem.pm:112
 "Make <b>%0</b> belong to which other item?"
 => "",

#: lib/FAQ/OMatic/moveItem.pm:116
 "No item that already has sub-items can become the parent of"
 => "",

#: lib/FAQ/OMatic/moveItem.pm:118
 "No item can become the parent of"
 => "",

# Russian
#: lib/FAQ/OMatic/moveItem.pm:122
 "Some destinations are not available (not clickable) because you do not have permission to edit them as currently authorized."
 => "[R] ��������� ���� ���������� (�� ��� ������ ��������), ��������� �� �� ������ ���������� ���� ��� �� �������������� (�� ������� ���� ��� ��� ���������������, ��� ������� �� ������ �����).",

#: lib/FAQ/OMatic/moveItem.pm:125
 "Click here</a> to provide better authentication."
 => "",

#: lib/FAQ/OMatic/moveItem.pm:131
 "Hide answers, show only categories"
 => "������� צ���צĦ, ���������� ���� ������Ҧ�",

#: lib/FAQ/OMatic/moveItem.pm:134
 "Show both categories and answers"
 => "���������� �� ������Ҧ�, ��� � צ���צĦ",

# Russian
#: lib/FAQ/OMatic/search.pm:72
 "No items matched all of these words"
 => "[R] �� ������� �� ������ ���������, ���������������� ���� �������� ������",

# Russian
#: lib/FAQ/OMatic/search.pm:76
#, c-format
 "No items matched at least %0 of these words"
 => "[R] �� ������� �� ������ ���������, ����������������, ��� �������, %0 �� �������� ����",

# Russian
#: lib/FAQ/OMatic/search.pm:85
 "Search results for all of these words"
 => "[R] ���������� ������ ����������, ��������������� ���� �������� ������",

# Russian
#: lib/FAQ/OMatic/search.pm:89
#, c-format
 "Search results for at least %0 of these words"
 => "[R] ���������� ������ ����������, ���������������, ��� �������, %0 �� �������� ����",

# Russian
#: lib/FAQ/OMatic/search.pm:106
 "Results may be incomplete, because the search index has not been refreshed since the most recent change to the database."
 => "[R] ��������� ����� ���� �������, ��������� ��������� ������ �� ����� ���������� ����� ������ ������� ��������� � ���� ������.",

# Russian
#: lib/FAQ/OMatic/searchForm.pm:52
 "search for keywords"
 => "[R] ����� �� �������� ������",

#: lib/FAQ/OMatic/searchForm.pm:57
 "Search for"
 => "������",

#: lib/FAQ/OMatic/searchForm.pm:58
 "matching"
 => "�����Φ �Ц�������:",

#: lib/FAQ/OMatic/searchForm.pm:60
 "all"
 => "�Ӧ",

#: lib/FAQ/OMatic/searchForm.pm:61
 "any"
 => "����-���",

#: lib/FAQ/OMatic/searchForm.pm:62
 "two"
 => "���",

#: lib/FAQ/OMatic/searchForm.pm:63
 "three"
 => "���",

#: lib/FAQ/OMatic/searchForm.pm:64
 "four"
 => "������",

#: lib/FAQ/OMatic/searchForm.pm:65
 "five"
 => "�'���",

#: lib/FAQ/OMatic/searchForm.pm:67
 "words"
 => "����(�,�)/�̦�",

#: lib/FAQ/OMatic/searchForm.pm:75
 "search for recent changes"
 => "����� �צ��� �ͦ�",

#: lib/FAQ/OMatic/searchForm.pm:81
 "Show documents"
 => "�������� ���������",

#: lib/FAQ/OMatic/searchForm.pm:82
 "modified in the last"
 => "���� ���� �ͦ���� �� �����Φ(�)",

#: lib/FAQ/OMatic/searchForm.pm:84
 "day"
 => "����",

#: lib/FAQ/OMatic/searchForm.pm:85
 "two days"
 => "��� ���",

#: lib/FAQ/OMatic/searchForm.pm:86
 "three days"
 => "��� ���",

#: lib/FAQ/OMatic/searchForm.pm:87
 "week"
 => "�������",

#: lib/FAQ/OMatic/searchForm.pm:88
 "fortnight"
 => "��� �����",

#: lib/FAQ/OMatic/searchForm.pm:89
 "month"
 => "ͦ����",

#: lib/FAQ/OMatic/selectBag.pm:69
 "Replace which bag?"
 => "",

#: lib/FAQ/OMatic/stats.pm:69
 "Hits Per Day"
 => "",

#: lib/FAQ/OMatic/stats.pm:70
 "Cumulative Hits"
 => "",

#: lib/FAQ/OMatic/stats.pm:74
 "New Hosts Per Day"
 => "",

#: lib/FAQ/OMatic/stats.pm:75
 "Total Hosts"
 => "",

#: lib/FAQ/OMatic/stats.pm:79
 "Hits Per Host"
 => "",

#: lib/FAQ/OMatic/stats.pm:80
 "Cumulative Searches"
 => "",

#: lib/FAQ/OMatic/stats.pm:83
 "Submissions Per Day"
 => "",

#: lib/FAQ/OMatic/stats.pm:84
 "Cumulative Submissions"
 => "",

# Russian
#: lib/FAQ/OMatic/stats.pm:87
 "Please be patient ... the image files are generated dynamically, and can take from 20 to 50 seconds to create.\n"
 => "[R] ����������, ������ ���������... ����������� ������������ �����������, � �� �� �������� ����� ������������� �� 20 �� 50 ������.\n",

#: lib/FAQ/OMatic/stats.pm:137
 "Change View Duration"
 => "",

#: lib/FAQ/OMatic/stats.pm:140
 "One Month"
 => "",

#: lib/FAQ/OMatic/stats.pm:142
 "Two Months"
 => "",

#: lib/FAQ/OMatic/stats.pm:144
 "Three Months"
 => "",

#: lib/FAQ/OMatic/stats.pm:146
 "History"
 => "",

# Russian
#: lib/FAQ/OMatic/submitBag.pm:50
 "Bag names may only contain letters, numbers, underscores (_), hyphens (-), and periods (.), and may not end in '.desc'. Yours was"
 => "[R] �������� \"������\" ����� ��������� ������ �����, �����, ����� ������������� (_), ����� �������� (-) � ����� (.), � �� ����� ������������� �� '.desc'.  ���� ����",

#: lib/FAQ/OMatic/submitItem.pm:61
 "Your browser or WWW cache has truncated your POST."
 => "",

# Russian
#: lib/FAQ/OMatic/submitItem.pm:72
 "Changed the item title, was \"%0\""
 => "[R] ������� ��������� ��������, ���� \"%0\"",

#: lib/FAQ/OMatic/submitItem.pm:88 lib/FAQ/OMatic/submitItem.pm:98
 "Your part order list (%0) "
 => "",

#: lib/FAQ/OMatic/submitItem.pm:89
 "doesn't have the same number of parts (%0) as the original item."
 => "",

#: lib/FAQ/OMatic/submitItem.pm:99
#, c-format
 "doesn't say what to do with part %0."
 => "",

# Russian
#: lib/FAQ/OMatic/submitMove.pm:51
 "The moving file (%0) is broken or missing."
 => "[R] ������������ ���� (%0) ��������� ��� �����������.",

#: lib/FAQ/OMatic/submitMove.pm:57
 "The newParent file (%0) is broken or missing."
 => "",

#: lib/FAQ/OMatic/submitMove.pm:66
 "The oldParent file (%0) is broken or missing."
 => "",

#: lib/FAQ/OMatic/submitMove.pm:74
 "The new parent (%0) is the same as the old parent."
 => "",

#: lib/FAQ/OMatic/submitMove.pm:79
 "The new parent (%0) is the same as the item you want to move."
 => "",

#: lib/FAQ/OMatic/submitMove.pm:86
 "The new parent (%0) is a child of the item being moved (%1)."
 => "",

# Russian
#: lib/FAQ/OMatic/submitMove.pm:92
 "You can't move the top item."
 => "[R] �� �� ������ ���������� ������� �������.",

# Russian
#: lib/FAQ/OMatic/submitMove.pm:130
#, c-format
 "moved a sub-item to %0"
 => "[R] ���������, ��� ���������� � %0",

# Russian
#: lib/FAQ/OMatic/submitMove.pm:133
#, c-format
 "moved a sub-item from %0"
 => "[R] ���������, ��� ���������� �� %0",

#: lib/FAQ/OMatic/submitPass.pm:49
 "An email address must look like 'name\@some.domain'."
 => "Email-������ ������� ���� ������ 'name\@some.domain'.",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:51
 "If yours (%0) does and I keep rejecting it, please mail %1 and tell him what's happening."
 => "[R] ���� ��� ������ email (%0) ������������� ����� ��������, �� ���-����� �����������, ����������, �������� %1 � ���������� ���, ��� ��������� (������, ����������, ������ ��-���������!)",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:58
 "Your password may not contain spaces or carriage returns."
 => "[R] ��� ������ �� ����� ��������� �������� � ��������� �������.",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:90
 "Your Faq-O-Matic authentication secret"
 => "[R] ",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:113
 "I couldn't mail the authentication secret to \"%0\" and I'm not sure why."
 => "[R] �� ������� ��������� ������������������ ��������� ��� �� \"%0\" � ��� ������� ����������� ������.",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:123
 "The secret you entered is not correct."
 => "[R] ��������� ���, ������� �� ����� -- ������������.",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:125
 "Did you copy and paste the secret or the URL completely?"
 => "[R] �� �������, ��� ����������� ��������� ��� ��� URL ���������?",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:129
 "I sent email to you at \"%0\". It should arrive soon, containing a URL."
 => "[R] �� ��� ����� \"%0\" ���� ������� ������.  ��� ������ ����� ������ � ��������� � ���� URL.",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:133
 "Either open the URL directly, or paste the secret into the form below and click Validate."
 => "[R] ��� �������� ���� URL ��������, ��� ���������� ��������� ��� (Secret) � ������������� ���� ����� � ������� <code>[���������]</code>.",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:135
 "Thank you for taking the time to sign up."
 => "[R] �������, ��� ����� ����� �����������.",

# Russian
#: lib/FAQ/OMatic/submitPass.pm:143
 "Secret:"
 => "[R] ��������� ���:",


);  # end of %data hash

    my $msgid;

    foreach $msgid (keys(%data))
    {
        $tx->{$msgid} = $data{$msgid};
    }
    return 1;
}
