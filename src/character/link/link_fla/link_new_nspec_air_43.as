// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_nspec_air_43

package link_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class link_new_nspec_air_43 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var sound:Number;
        public var self:*;
        public var xframe:String;
        public var controls:Object;
        public var itemHeld:String;
        public var bombs:Boolean;
        public var nSpecStored:String;
        public var nSpecCharge:Number;

        public function link_new_nspec_air_43()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 30, this.frame31, 31, this.frame32, 32, this.frame33, 33, this.frame34, 34, this.frame35, 35, this.frame36, 36, this.frame37, 37, this.frame38, 38, this.frame39, 39, this.frame40, 40, this.frame41, 43, this.frame44);
        }

        internal function frame1():*
        {
            this.sound = 0;
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.itemHeld = null;
            this.bombs = false;
            this.nSpecStored = null;
            this.nSpecCharge = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("sStoredLabel", null);
                this.self.setGlobalVariable("globCharge", 0);
                this.nSpecStored = this.self.getGlobalVariable("nStoredLabel");
                if (((!(this.nSpecStored == "Frame1")) && (!(this.nSpecStored == null))))
                {
                    gotoAndPlay(this.nSpecStored);
                }
                else
                {
                    this.self.setGlobalVariable("nStoredLabel", "Frame1");
                };
                this.self.setGlobalVariable("bombType", "none");
                if (this.self.getItem() != null)
                {
                    this.itemHeld = this.self.getItem().getLinkageID();
                };
                if (this.itemHeld == "link_bomb")
                {
                    this.bombs = true;
                    if (((this.nSpecStored == "Frame1") || (this.nSpecStored == null)))
                    {
                        gotoAndPlay("bombArrow");
                    };
                };
            };
        }

        internal function frame2():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame2");
        }

        internal function frame3():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame3");
        }

        internal function frame4():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame4");
        }

        internal function frame5():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame5");
        }

        internal function frame6():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame6");
        }

        internal function frame7():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame7");
        }

        internal function frame8():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame8");
            this.sound = this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame9");
        }

        internal function frame10():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame10");
        }

        internal function frame11():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame11");
        }

        internal function frame12():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame12");
        }

        internal function frame13():*
        {
            this.xframe = "charging";
            if (this.itemHeld == "link_bomb")
            {
                gotoAndPlay("bombCharging");
            }
            else
            {
                this.self.setGlobalVariable("nStoredLabel", "charging");
            };
        }

        internal function frame16():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame17():*
        {
            this.xframe = "attack";
            this.nSpecStored = this.self.getGlobalVariable("nStoredLabel");
            this.nSpecCharge = this.self.getAttackStat("chargetime");
            this.self.setGlobalVariable("globCharge", this.nSpecCharge);
            if (((this.nSpecStored == "charging") || (this.nSpecStored == "bombCharging")))
            {
                this.self.setGlobalVariable("nStoredLabel", "attack");
                if (this.bombs)
                {
                    this.self.playAttackSound(2);
                    this.self.fireProjectile("nSpecBomb");
                    this.self.attachEffect("bombArrowSpawn");
                    this.self.removeItem();
                }
                else
                {
                    this.self.playAttackSound(2);
                    this.self.fireProjectile("nSpecArrow");
                    this.self.attachEffect("arrowSpawn");
                };
            }
            else
            {
                if (this.nSpecStored == "attack")
                {
                    gotoAndPlay("Frame18");
                }
                else
                {
                    gotoAndPlay(this.nSpecStored);
                };
            };
        }

        internal function frame18():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame18");
        }

        internal function frame19():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame19");
        }

        internal function frame20():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame20");
        }

        internal function frame21():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame21");
        }

        internal function frame22():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame22");
        }

        internal function frame23():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame23");
        }

        internal function frame24():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame24");
        }

        internal function frame25():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame25");
        }

        internal function frame26():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame26");
        }

        internal function frame27():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame27");
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            this.self.setGlobalVariable("nStoredLabel", "bombArrow");
        }

        internal function frame30():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame2");
        }

        internal function frame31():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame3");
        }

        internal function frame32():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame4");
        }

        internal function frame33():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame5");
        }

        internal function frame34():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame6");
        }

        internal function frame35():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame7");
        }

        internal function frame36():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame8");
            this.sound = this.self.playAttackSound(1);
        }

        internal function frame37():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame9");
        }

        internal function frame38():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame10");
        }

        internal function frame39():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame11");
        }

        internal function frame40():*
        {
            this.self.setGlobalVariable("nStoredLabel", "BombFrame12");
        }

        internal function frame41():*
        {
            this.xframe = "charging";
            this.self.setGlobalVariable("nStoredLabel", "bombCharging");
        }

        internal function frame44():*
        {
            this.gotoAndPlay("bombCharging");
        }


    }
}//package link_fla

