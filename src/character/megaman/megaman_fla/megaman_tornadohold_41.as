// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_tornadohold_41

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

    public dynamic class megaman_tornadohold_41 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var pLockBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function megaman_tornadohold_41()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 15, this.frame16, 17, this.frame18, 19, this.frame20, 21, this.frame22, 23, this.frame24, 25, this.frame26, 37, this.frame38);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
        }

        internal function frame18():*
        {
            this.self.updateAttackBoxStats(1, {"direction":135});
        }

        internal function frame20():*
        {
            this.self.updateAttackBoxStats(1, {"direction":135});
        }

        internal function frame22():*
        {
            this.self.updateAttackBoxStats(1, {"direction":135});
        }

        internal function frame24():*
        {
            this.self.updateAttackBoxStats(1, {"direction":135});
        }

        internal function frame26():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":90,
                "damage":6,
                "power":50,
                "kbConstant":180,
                "effectSound":"sw_bigscratch"
            });
            this.self.updateAttackStats({"refreshRate":50});
            this.self.refreshAttackID();
        }

        internal function frame38():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

