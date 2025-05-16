// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.knightcrush_44

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

    public dynamic class knightcrush_44 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;
        public var chargeTime:*;
        public var damageCharged:Number;

        public function knightcrush_44()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 13, this.frame14, 14, this.frame15, 19, this.frame20, 25, this.frame26, 34, this.frame35);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame9():*
        {
            this.xframe = "charging";
        }

        internal function frame14():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame15():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(1);
            this.chargeTime = (this.self.getExecTime() - 7);
            this.damageCharged = (((8 * this.chargeTime) / 40) + 14);
            this.self.updateAttackBoxStats(1, {"damage":this.damageCharged});
        }

        internal function frame20():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
        }

        internal function frame26():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
        }

        internal function frame35():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

