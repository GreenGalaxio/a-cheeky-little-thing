// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_sheik_196

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

    public dynamic class kirby_sheik_196 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var num_needles:int;
        public var xframe:String;
        public var charge:*;

        public function kirby_sheik_196()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 15, this.frame16, 16, this.frame17, 19, this.frame20, 20, this.frame21, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame7():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            gotoAndPlay("charging");
        }

        internal function frame17():*
        {
            this.xframe = "attack";
            this.charge = SSF2API.getCharacter(this.self.getID()).getAttackStat("chargetime");
            this.num_needles = ((this.charge / 10) + 1);
        }

        internal function frame20():*
        {
            this.num_needles--;
            if (!this.self.isOnGround())
            {
                this.self.fireProjectile("airneedle");
            }
            else
            {
                this.self.fireProjectile("needle");
            };
        }

        internal function frame21():*
        {
            if (this.num_needles <= 0)
            {
                gotoAndPlay("finish");
            }
            else
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

