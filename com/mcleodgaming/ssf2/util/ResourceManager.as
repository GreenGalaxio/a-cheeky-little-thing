package com.mcleodgaming.ssf2.util
{
   import com.mcleodgaming.ssf2.Main;
   import com.mcleodgaming.ssf2.engine.SSF2File;
   
   public class ResourceManager
   {
       
      
      public function ResourceManager()
      {
         super();
      }
      
      public static function init(param1:Vector.<SSF2File>) : void
      {
         param1.push(new SSF2File("mario","mario.ssf","DAT44.ssf","b4768513-c851-4f19-8c73-6f18e4f27b64",Resource.CHARACTER));
         param1.push(new SSF2File("lloyd","lloyd.ssf","DAT80.ssf","45af93ac-000a-4b46-b897-f7cc4a79d50b",Resource.CHARACTER));
         param1.push(new SSF2File("ichigo","ichigo.ssf","DAT52.ssf","17955b8c-7dff-4167-ada2-b89d5e1562b8",Resource.CHARACTER));
         param1.push(new SSF2File("wario","wario.ssf","DAT9.ssf","e98d84bd-4a2d-4a2a-8440-f38caa78b7d4",Resource.CHARACTER));
         param1.push(new SSF2File("megaman","megaman.ssf","DAT42.ssf","716b3fa7-a83b-42fe-b781-3ac8f0063fd6",Resource.CHARACTER));
         param1.push(new SSF2File("kirby","kirby.ssf","DAT15.ssf","5f670bf6-edee-4bbf-b247-3a51d5ebddd3",Resource.CHARACTER));
         param1.push(new SSF2File("link","link.ssf","DAT20.ssf","6c4013ee-0672-4264-80e8-a3d63c506a6c",Resource.CHARACTER));
         param1.push(new SSF2File("sonic","sonic.ssf","DAT62.ssf","7b84c137-a56c-4db9-b154-154c9da71076",Resource.CHARACTER));
         param1.push(new SSF2File("sora","sora.ssf","DAT87.ssf","57068ce5-ad07-446a-8a80-5a2939219e9f",Resource.CHARACTER));
         param1.push(new SSF2File("naruto","naruto.ssf","DAT67.ssf","d6a9d9ac-29fa-4015-bd40-81e2769db6ae",Resource.CHARACTER));
         param1.push(new SSF2File("ness","ness.ssf","DAT59.ssf","4e1cd2be-4e9d-4fae-8fb9-d81ed2ba93d9",Resource.CHARACTER));
         param1.push(new SSF2File("tails","tails.ssf","DAT37.ssf","d83b1ca4-568d-44e9-9de3-d850b54b1643",Resource.CHARACTER));
         param1.push(new SSF2File("goku","goku.ssf","DAT22.ssf","5652e175-9647-4342-a726-105cb4fab89a",Resource.CHARACTER));
         param1.push(new SSF2File("peach","peach.ssf","DAT19.ssf","e7a05f86-e27b-4066-a4eb-447866207179",Resource.CHARACTER));
         param1.push(new SSF2File("blackmage","blackmage.ssf","DAT38.ssf","9b58e501-9135-4535-a349-53d9efde8809",Resource.CHARACTER));
         param1.push(new SSF2File("pikachu","pikachu.ssf","DAT47.ssf","946e3554-6365-4321-8a04-aeac03dba42a",Resource.CHARACTER));
         param1.push(new SSF2File("fox","fox.ssf","DAT85.ssf","f207f49e-ebb8-462c-a8be-0d5b7aced723",Resource.CHARACTER));
         param1.push(new SSF2File("yoshi","yoshi.ssf","DAT58.ssf","cc7f6275-769a-403a-aadf-725696cfbc79",Resource.CHARACTER));
         param1.push(new SSF2File("donkeykong","donkeykong.ssf","DAT74.ssf","1c0a5cc2-123d-415f-8c2b-44031b295965",Resource.CHARACTER));
         param1.push(new SSF2File("captainfalcon","captainfalcon.ssf","DAT36.ssf","addc9f5b-48d8-49df-9b23-e53d64c0c65e",Resource.CHARACTER));
         param1.push(new SSF2File("zelda","zelda.ssf","DAT93.ssf","68019ba3-5e17-4104-9a4c-3f9b8e4b3fe8",Resource.CHARACTER));
         param1.push(new SSF2File("sheik","zelda.ssf","DAT93.ssf","68019ba3-5e17-4104-9a4c-3f9b8e4b3fe8",Resource.CHARACTER));
         param1.push(new SSF2File("jigglypuff","jigglypuff.ssf","DAT46.ssf","8fb252a6-b3fe-4572-8424-cc5f0f89f54e",Resource.CHARACTER));
         param1.push(new SSF2File("metaknight","metaknight.ssf","DAT0.ssf","94736651-1a09-4993-a55b-5b96aa402331",Resource.CHARACTER));
         param1.push(new SSF2File("marth","marth.ssf","DAT78.ssf","9f391931-db1b-47a9-82b1-2c1d2560c6b7",Resource.CHARACTER));
         param1.push(new SSF2File("bowser","bowser.ssf","DAT7.ssf","5aaef56e-4ee3-4586-b2f8-c38985e8f457",Resource.CHARACTER));
         param1.push(new SSF2File("samus","samus.ssf","DAT41.ssf","abad854d-8167-43a7-96a8-d0a666a8ffd3",Resource.CHARACTER));
         param1.push(new SSF2File("zamus","zamus.ssf","DAT66.ssf","1ce8dafd-54ea-480a-a2d0-30c1e6db4dbf",Resource.CHARACTER));
         param1.push(new SSF2File("bomberman","bomberman.ssf","DAT57.ssf","5db5bfc3-78aa-4ae8-8208-c39174673a01",Resource.CHARACTER));
         param1.push(new SSF2File("chibirobo","chibirobo.ssf","DAT49.ssf","c51a5173-a652-4c9a-9410-87b46e9702c3",Resource.CHARACTER));
         param1.push(new SSF2File("gameandwatch","gameandwatch.ssf","DAT83.ssf","65319743-bb44-4f70-87ce-cee7a2551a18",Resource.CHARACTER));
         param1.push(new SSF2File("isaac","isaac.ssf","DAT68.ssf","52250ee5-0349-4ba7-ad59-09f44465291e",Resource.CHARACTER));
         param1.push(new SSF2File("sandbag","sandbag.ssf","DAT24.ssf","45222bb7-fb4d-4103-b84e-84ebd27839fa",Resource.CHARACTER));
         param1.push(new SSF2File("audio","ssf2_audio.ssf","DAT43.ssf","36277bd4-4917-42e3-afc8-be171dc8ba75",Resource.AUDIO));
         param1.push(new SSF2File("misc2","misc2.ssf","DAT84.ssf","c6919736-6be3-46f0-b815-73abae7e9fc3",Resource.MISC));
         param1.push(new SSF2File("misc","misc.ssf","DAT8.ssf","e8bd4437-5786-4645-9ce8-399c99ec71c9",Resource.MISC));
         param1.push(new SSF2File("menu_main","menu_main.ssf","DAT6.ssf","8c8d5878-9630-4c56-9b0a-069eccb9fb5a",Resource.MENU));
         param1.push(new SSF2File("menu_modes","menu_modes.ssf","DAT32.ssf","cdf5fc26-48fa-4f20-9279-e01e4cea0fe2",Resource.MENU));
         param1.push(new SSF2File("ssf2intro_v8","ssf2intro_v8.ssf","DAT45.ssf","b33bb564-74b7-4476-b9ee-d0aa83cdd5a2",Resource.EXTRA));
         param1.push(new SSF2File("ssf2intro_v9","ssf2intro_v9.ssf","DAT23.ssf","1a859791-8c60-44d8-9c2c-b401ce0d951e",Resource.MISC));
         param1.push(new SSF2File("disclaimer","disclaimer.ssf","DAT16.ssf","13e6bb87-928a-400e-a857-16b548777c4e",Resource.MISC));
         param1.push(new SSF2File("waitingroom","waitingroom.ssf","DAT39.ssf","9a13e61a-bf28-4396-9d37-ac8a97c3a03b",Resource.STAGE));
         param1.push(new SSF2File("battlefield","battlefield.ssf","DAT89.ssf","ad6f95ac-4566-40eb-9ad3-e75702242cfd",Resource.STAGE));
         param1.push(new SSF2File("finaldestination","finaldestination.ssf","DAT25.ssf","1fd1576f-0b77-4c6f-9a7d-3fe6ac0e6ce0",Resource.STAGE));
         param1.push(new SSF2File("hyruletemple","hyruletemple.ssf","DAT34.ssf","3b853a71-ee2b-43ce-8383-10db58ba801c",Resource.STAGE));
         param1.push(new SSF2File("dreamland","dreamland.ssf","DAT60.ssf","7fbc6488-e6d7-420c-94fa-e244635c90a8",Resource.STAGE));
         param1.push(new SSF2File("greenhillzone","greenhillzone.ssf","DAT64.ssf","84d6e11b-369c-4f8b-9c93-7de59e642d51",Resource.STAGE));
         param1.push(new SSF2File("mushroomkingdom2","mushroomkingdom2.ssf","DAT61.ssf","f06df00c-ae12-411b-9fd4-7c92a3020184",Resource.STAGE));
         param1.push(new SSF2File("twilighttown","twilighttown.ssf","DAT30.ssf","56f42162-cd47-43d8-be56-8265fc2d0c86",Resource.STAGE));
         param1.push(new SSF2File("huecomundo","huecomundo.ssf","DAT29.ssf","54647e53-1c41-4995-afbb-dd769c2f656c",Resource.STAGE));
         param1.push(new SSF2File("konohavillage","konohavillage.ssf","DAT48.ssf","398f6974-49ef-4253-8967-50a749e649a1",Resource.STAGE));
         param1.push(new SSF2File("galaxytours","galaxytours.ssf","DAT88.ssf","f1eb7f31-1535-4d79-9419-0e904de27eaf",Resource.STAGE));
         param1.push(new SSF2File("castlewily","castlewily.ssf","DAT54.ssf","efaaa24f-942b-4031-bb52-74349799a3b4",Resource.STAGE));
         param1.push(new SSF2File("sectorz","sectorz.ssf","DAT69.ssf","84272dba-a44c-4d4b-abe5-0a036419bdc7",Resource.STAGE));
         param1.push(new SSF2File("towerofsalvation","towerofsalvation.ssf","DAT70.ssf","6fb5d183-c213-4f8d-bcf8-832ef8fb9cdf",Resource.STAGE));
         param1.push(new SSF2File("casinonightzone","casinonightzone.ssf","DAT13.ssf","51484658-3913-4eef-afdd-15dbcc01bdda",Resource.STAGE));
         param1.push(new SSF2File("rainbowroute","rainbowroute.ssf","DAT18.ssf","c02c1532-40ba-4e2a-8a7a-3dad26f05b87",Resource.STAGE));
         param1.push(new SSF2File("saturnvalley","saturnvalley.ssf","DAT94.ssf","e16b7535-9a52-4426-bf49-92470e6eade8",Resource.STAGE));
         param1.push(new SSF2File("junglehijinx","junglehijinx.ssf","DAT1.ssf","c19a717f-eeb7-46eb-8672-a4b5cda2f616",Resource.STAGE));
         param1.push(new SSF2File("centralhighway","centralhighway.ssf","DAT14.ssf","bd592ce0-ad68-492d-b664-7e914dcaab68",Resource.STAGE));
         param1.push(new SSF2File("warioware","warioware.ssf","DAT90.ssf","f0f9a82a-531b-46e8-9ce0-03a58042629f",Resource.STAGE));
         param1.push(new SSF2File("templeoftime","templeoftime.ssf","DAT55.ssf","e5fc42e8-a4d9-4b9e-99ac-37dd1dee9cda",Resource.STAGE));
         param1.push(new SSF2File("yoshisisland","yoshisisland.ssf","DAT75.ssf","9fc1f800-5aae-45f4-8979-9f605a86d2af",Resource.STAGE));
         param1.push(new SSF2File("planetnamek","planetnamek.ssf","DAT5.ssf","6a858747-1df4-4bf2-ae09-090c27db416c",Resource.STAGE));
         param1.push(new SSF2File("chaosshrine","chaosshrine.ssf","DAT50.ssf","9669b85c-fa35-443a-8cf9-7cddb9bf8e52",Resource.STAGE));
         param1.push(new SSF2File("shadowmosesisland","shadowmosesisland.ssf","DAT86.ssf","dcd65695-7249-4632-afc6-60db930db386",Resource.STAGE));
         param1.push(new SSF2File("clocktown","clocktown.ssf","DAT17.ssf","eb13a025-dead-4fa1-9344-6904d7556bea",Resource.STAGE));
         param1.push(new SSF2File("skysanctuary","skysanctuary.ssf","DAT71.ssf","85462325-8e72-46fb-9807-93c165d2643c",Resource.STAGE));
         param1.push(new SSF2File("gangplankgalleon","gangplankgalleon.ssf","DAT21.ssf","b9c338ce-f61a-466d-a9e3-5c6dba0777db",Resource.STAGE));
         param1.push(new SSF2File("skyworld","skyworld.ssf","DAT26.ssf","3d362503-d534-4e8b-ac2c-ddc5721317f5",Resource.STAGE));
         param1.push(new SSF2File("mushroomkingdom3","mushroomkingdom3.ssf","DAT79.ssf","0838825f-ca19-4452-96d5-6d9beb4d659d",Resource.STAGE));
         param1.push(new SSF2File("fourside","fourside.ssf","DAT92.ssf","c970d1df-a3d6-4de7-b761-a90bd60215ca",Resource.STAGE));
         param1.push(new SSF2File("pokemonstadium3","pokemonstadium3.ssf","DAT77.ssf","52372260-aa56-4f81-91d1-9125503d30b5",Resource.STAGE));
         param1.push(new SSF2File("peachscastle","peachscastle.ssf","DAT3.ssf","7989887c-6ead-46c3-a514-c14f3b0135c4",Resource.STAGE));
         param1.push(new SSF2File("crateria","crateria.ssf","DAT4.ssf","a84cddaa-14aa-4f83-b4e0-61faa8113c6d",Resource.STAGE));
         param1.push(new SSF2File("smashville","smashville.ssf","DAT63.ssf","2974ce3a-44de-415f-bc8d-d434f6fe0da2",Resource.STAGE));
         param1.push(new SSF2File("sandocean","sandocean.ssf","DAT2.ssf","5c8fc04d-2fc8-4c6b-b26b-4d76fde1c838",Resource.STAGE));
         param1.push(new SSF2File("castlesiege","castlesiege.ssf","DAT27.ssf","960c23e4-5910-4b1f-9c59-4935781ae00c",Resource.STAGE));
         param1.push(new SSF2File("yoshisstory","yoshisstory.ssf","DAT51.ssf","78ec5f26-dcf3-4699-beaf-68f43f4e5c37",Resource.STAGE));
         param1.push(new SSF2File("targettest","targettest.ssf","DAT65.ssf","1bb4f664-f0cd-439c-a726-eb711afdfd4f",Resource.STAGE));
         param1.push(new SSF2File("targettest2","targettest2.ssf","DAT81.ssf","ad01f0cd-9dd7-46c0-9c2f-a4ed0125adc6",Resource.STAGE));
         param1.push(new SSF2File("targettest3","targettest3.ssf","DAT28.ssf","be3320f1-201f-4b15-9d18-4e0092653fcc",Resource.STAGE));
         param1.push(new SSF2File("bowserscastle","bowserscastle.ssf","DAT95.ssf","d2682e2b-5af4-4774-89e8-dc75952d403d",Resource.STAGE));
         param1.push(new SSF2File("emeraldcave","emeraldcave.ssf","DAT31.ssf","ce3d78f5-a7f5-4a71-a6c0-68e38e689ed2",Resource.STAGE));
         param1.push(new SSF2File("nintendo3ds","nintendo3ds.ssf","DAT12.ssf","35d7b2e5-4bba-478e-8113-0620149a3b48",Resource.STAGE));
         param1.push(new SSF2File("skywardvoyage","skywardvoyage.ssf","DAT96.ssf","47b7422d-a5a4-445d-821f-cf490a205f7b",Resource.STAGE));
         param1.push(new SSF2File("hylianskies","hylianskies.ssf","DAT53.ssf","0e8bba01-4206-406e-8426-13475d21fa7f",Resource.STAGE));
         param1.push(new SSF2File("butterbuilding","butterbuilding.ssf","DAT76.ssf","13f7e61c-fa1f-4cdc-a483-4026ec627342",Resource.STAGE));
         param1.push(new SSF2File("lakeofrage","lakeofrage.ssf","DAT73.ssf","4716535b-dc1c-43e6-b57f-b9116eb15ae5",Resource.STAGE));
         param1.push(new SSF2File("silphco","silphco.ssf","DAT91.ssf","0ed03185-d4f0-4b40-a5a7-c31738ee59f4",Resource.STAGE));
         param1.push(new SSF2File("phase8","phase8.ssf","DAT35.ssf","dc973197-b371-4e18-bf93-9f07861d9f10",Resource.STAGE));
         param1.push(new SSF2File("iceclimbersstage","iceclimbersstage.ssf","DAT11.ssf","3eeaa99b-dc0b-4767-b10e-583a30c7ae30",Resource.STAGE));
         param1.push(new SSF2File("draculascastle","draculascastle.ssf","DAT72.ssf","efac6fad-6751-4804-aac5-7a7dd0253636",Resource.STAGE));
         param1.push(new SSF2File("bombfactory","bombfactory.ssf","DAT10.ssf","1360391f-1a8e-4dc9-9032-7c347dd40a67",Resource.STAGE));
         param1.push(new SSF2File("lunarcore","lunarcore.ssf","DAT40.ssf","09f18b4d-7992-469b-9a63-e1a2d4d43a77",Resource.STAGE));
         param1.push(new SSF2File("distantplanet","distantplanet.ssf","DAT56.ssf","e965e152-fc63-4809-8a83-1c519ebf3c29",Resource.STAGE));
         param1.push(new SSF2File("meteovoyage","meteovoyage.ssf","DAT33.ssf","b811c48b-97de-4827-b432-414d4baac2f6",Resource.STAGE));
         if(Main.DEBUG)
         {
            param1.push(new SSF2File("test1","test1.swf","test1.swf","",Resource.CHARACTER_EXPANSION));
            param1.push(new SSF2File("test2","test2.swf","test2.swf","",Resource.CHARACTER_EXPANSION));
            param1.push(new SSF2File("test3","test3.swf","test3.swf","",Resource.CHARACTER_EXPANSION));
            param1.push(new SSF2File("test4","test4.swf","test4.swf","",Resource.CHARACTER_EXPANSION));
            param1.push(new SSF2File("xpstage","xpstage1.swf","xpstage1.swf","",Resource.STAGE_EXPANSION));
         }
      }
   }
}
