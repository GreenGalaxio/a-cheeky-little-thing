// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.Usmash_27

package pikachu_fla
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

    public dynamic class Usmash_27 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;
        public var getTarget:Object;
        public var lvl:int;

        public function Usmash_27()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 11, this.frame12, 12, this.frame13, 16, this.frame17, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame6():*
        {
            this.xframe = "charging";
        }

        internal function frame11():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame12():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame17():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":9,
                "hitStun":2,
                "selfHitStun":1,
                "power":35,
                "kbConstant":65,
                "direction":50
            });
        }

        internal function frame27():*
        {
            this.getTarget = null;
            this.lvl = 0;
            if (((((parent) && (SSF2API.isReady())) && (this.self)) && (this.self.isCPU())))
            {
                this.getTarget = this.self.getCPUTarget();
                this.lvl = this.self.getCPULevel();
                if (((((this.lvl > 7) && (this.getTarget.getX() < (parent.x + 25))) && (this.getTarget.getX() > (parent.x - 25))) && (this.getTarget.getY() < (parent.y - 125))))
                {
                    this.self.importCPUControls([1088, 1]);
                };
            };
            this.self.endAttack();
        }


    }
}//package pikachu_fla

