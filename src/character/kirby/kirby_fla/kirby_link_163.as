// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_link_163

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_link_163 extends MovieClip 
    {

        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var controls:Object;
        public var itemHeld:String;
        public var bombs:Boolean;
        public var shotFired:Boolean;
        public var nSpecCharge:Number;
        public var sound:Number;

        public function kirby_link_163()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 12, this.frame13, 16, this.frame17, 17, this.frame18, 28, this.frame29, 36, this.frame37, 41, this.frame42, 44, this.frame45);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.itemHeld = null;
            this.bombs = false;
            this.shotFired = false;
            this.nSpecCharge = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("globCharge", 0);
                this.self.setGlobalVariable("bombType", "none");
                if (this.self.getItem() != null)
                {
                    this.itemHeld = this.self.getItem().getLinkageID();
                };
                if (this.itemHeld == "link_bomb")
                {
                    this.bombs = true;
                    gotoAndPlay("bombArrow");
                };
            };
            this.sound = 0;
        }

        internal function frame8():*
        {
            this.sound = this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.xframe = "charging";
            if (this.itemHeld == "link_bomb")
            {
                gotoAndPlay("bombCharging");
            };
        }

        internal function frame17():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame18():*
        {
            this.xframe = "attack";
            this.nSpecCharge = this.self.getAttackStat("chargetime");
            this.self.setGlobalVariable("globCharge", this.nSpecCharge);
            this.self.setGlobalVariable("nStoredLabel", "attack");
            if (this.bombs)
            {
                this.self.playAttackSound(2);
                this.self.fireProjectile("nSpecBomb");
                this.self.attachEffect("bombArrowSpawn");
                this.self.removeItem();
                SSF2API.stopSound(this.sound);
            }
            else
            {
                this.self.playAttackSound(2);
                this.self.fireProjectile("nSpecArrow");
                this.self.attachEffect("arrowSpawn");
                SSF2API.stopSound(this.sound);
            };
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }

        internal function frame37():*
        {
            this.sound = this.self.playAttackSound(1);
        }

        internal function frame42():*
        {
            this.xframe = "charging";
        }

        internal function frame45():*
        {
            this.gotoAndPlay("bombCharging");
        }


    }
}//package kirby_fla

