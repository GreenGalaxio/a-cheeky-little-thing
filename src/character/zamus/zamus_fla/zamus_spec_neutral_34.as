// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zamus_fla.zamus_spec_neutral_34

package zamus_fla
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

    public dynamic class zamus_spec_neutral_34 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var nSpecStored:String;
        public var self:*;
        public var controls:Object;

        public function zamus_spec_neutral_34()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 30, this.frame31, 31, this.frame32, 32, this.frame33);
        }

        internal function frame1():*
        {
            this.nSpecStored = null;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.self.setGlobalVariable("tether", false);
                this.controls = this.self.getControls();
                this.nSpecStored = this.self.getGlobalVariable("nStoredLabel");
                if (((!(this.nSpecStored == "Frame1")) && (!(this.nSpecStored == null))))
                {
                    gotoAndPlay(this.nSpecStored);
                }
                else
                {
                    this.self.setGlobalVariable("nStoredLabel", "Frame1");
                };
            };
        }

        internal function frame2():*
        {
            this.self.setGlobalVariable("nStoredCharge", 0);
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
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                gotoAndPlay("fakeCharge");
            }
            else
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame12():*
        {
            this.nSpecStored = this.self.getGlobalVariable("nStoredLabel");
            if (this.nSpecStored == "Frame10")
            {
                this.self.setGlobalVariable("nStoredLabel", "attack");
                this.self.fireProjectile("paralyzer_weak");
                this.self.playAttackSound(2);
            }
            else
            {
                if (this.nSpecStored == "fakeCharge10")
                {
                    this.self.setGlobalVariable("nStoredLabel", "attack");
                    this.self.fireProjectile("paralyzer_strong");
                    this.self.playAttackSound(2);
                }
                else
                {
                    if (this.nSpecStored == "attack")
                    {
                        gotoAndPlay("Frame12");
                    }
                    else
                    {
                        gotoAndPlay(this.nSpecStored);
                    };
                };
            };
        }

        internal function frame13():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame12");
        }

        internal function frame14():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame13");
        }

        internal function frame15():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame14");
        }

        internal function frame16():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame15");
        }

        internal function frame17():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame16");
        }

        internal function frame18():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame17");
        }

        internal function frame19():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame18");
        }

        internal function frame20():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame19");
        }

        internal function frame21():*
        {
            this.self.setGlobalVariable("nStoredLabel", "Frame20");
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }

        internal function frame23():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge");
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge2");
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge");
        }

        internal function frame25():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge3");
        }

        internal function frame26():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge4");
        }

        internal function frame27():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge5");
        }

        internal function frame28():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge6");
        }

        internal function frame29():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge7");
        }

        internal function frame30():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge8");
        }

        internal function frame31():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge9");
        }

        internal function frame32():*
        {
            this.self.setGlobalVariable("nStoredLabel", "fakeCharge10");
        }

        internal function frame33():*
        {
            gotoAndPlay("attack");
        }


    }
}//package zamus_fla

