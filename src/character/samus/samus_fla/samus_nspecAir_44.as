// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_nspecAir_44

package samus_fla
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

    public dynamic class samus_nspecAir_44 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;
        public var controls:Object;
        public var speed:int;

        public function samus_nspecAir_44()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8, 22, this.frame23, 23, this.frame24, 29, this.frame30, 44, this.frame45);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                this.xframe = "charging";
                this.controls = this.self.getControls();
                this.speed = this.self.getAttackStat("chargetime");
                this.speed = (((this.speed / 12) + 3.2) * -1);
            };
        }

        internal function frame2():*
        {
            this.xframe = "attack2";
            if (this.self.getAttackStat("chargetime") >= this.self.getAttackStat("chargetime_max"))
            {
                this.gotoAndPlay("attack2");
            };
        }

        internal function frame8():*
        {
            this.self.fireProjectile("unchargedshot");
            this.self.setXSpeed(this.speed, false);
            this.self.setYSpeed(-3);
            this.self.playAttackSound(2);
            this.self.updateAttackStats({"cancelSoundOnEnd":false});
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }

        internal function frame24():*
        {
            this.xframe = "attack2";
        }

        internal function frame30():*
        {
            this.self.fireProjectile("chargedshot");
            this.self.setXSpeed(this.speed, false);
            this.self.setYSpeed(-5);
            this.self.playAttackSound(5);
            this.self.updateAttackStats({"cancelSoundOnEnd":false});
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

