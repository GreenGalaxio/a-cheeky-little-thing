// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.MegaBAirBomb_118

package megaman_fla
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

    public dynamic class MegaBAirBomb_118 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;
        public var controls:Object;
        public var projectile:*;

        public function MegaBAirBomb_118()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.controls = this.self.getControls();
                this.projectile = null;
                if (this.self.getGlobalVariable("crashBomb") == 2)
                {
                    SSF2API.print("crashBomb = 2");
                    gotoAndPlay("detonate");
                }
                else
                {
                    if (this.self.getGlobalVariable("crashBomb") == 1)
                    {
                        SSF2API.print("crashBomb = 1");
                        gotoAndPlay("noCrashBomb");
                    };
                };
                if (this.self.getGlobalVariable("crashBombProjectile") != null)
                {
                    this.projectile = this.self.getGlobalVariable("crashBombProjectile");
                };
                if (((!(this.projectile == null)) && (this.projectile.isDead())))
                {
                    this.projectile = null;
                    this.self.setGlobalVariable("crashBomb", 0);
                };
            };
        }

        internal function frame2():*
        {
            this.xframe = "bomb2";
        }

        internal function frame3():*
        {
            this.xframe = "bomb3";
        }

        internal function frame4():*
        {
            this.xframe = "bomb4";
        }

        internal function frame5():*
        {
            this.xframe = "bomb5";
        }

        internal function frame6():*
        {
            this.xframe = "bomb6";
        }

        internal function frame7():*
        {
            this.xframe = "bomb7";
        }

        internal function frame8():*
        {
            this.xframe = "bomb8";
        }

        internal function frame9():*
        {
            this.xframe = "bomb9";
            this.self.playAttackSound(2);
            this.self.fireProjectile("megaman_crashman", 0, -15);
        }

        internal function frame10():*
        {
            this.xframe = "bomb10";
            this.projectile = this.self.getCurrentProjectile();
            this.self.setGlobalVariable("crashBombProjectile", this.projectile);
        }

        internal function frame11():*
        {
            this.xframe = "bomb11";
        }

        internal function frame12():*
        {
            this.xframe = "bomb12";
        }

        internal function frame13():*
        {
            this.xframe = "bomb13";
        }

        internal function frame14():*
        {
            this.xframe = "bomb14";
            this.self.endAttack();
        }

        internal function frame15():*
        {
            if (((!(this.projectile == null)) && (!(this.projectile.isDead()))))
            {
                this.self.playAttackSound(3);
            };
        }

        internal function frame16():*
        {
            this.xframe = "bomb16";
        }

        internal function frame17():*
        {
            this.xframe = "bomb17";
            this.projectile.getStanceMC().gotoAndPlay("boom");
        }

        internal function frame18():*
        {
            this.xframe = "bomb18";
        }

        internal function frame19():*
        {
            this.xframe = "bomb19";
        }

        internal function frame20():*
        {
            this.xframe = "bomb20";
        }

        internal function frame21():*
        {
            this.xframe = "bomb21";
        }

        internal function frame22():*
        {
            this.xframe = "bomb22";
        }

        internal function frame23():*
        {
            this.xframe = "bomb23";
        }

        internal function frame24():*
        {
            this.xframe = "bomb24";
        }

        internal function frame25():*
        {
            this.xframe = "bomb25";
        }

        internal function frame26():*
        {
            this.xframe = "bomb26";
        }

        internal function frame27():*
        {
            this.xframe = "bomb27";
        }

        internal function frame28():*
        {
            this.xframe = "bomb28";
        }

        internal function frame29():*
        {
            this.xframe = "bomb29";
        }

        internal function frame30():*
        {
            this.xframe = "bomb30";
            this.self.endAttack();
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

