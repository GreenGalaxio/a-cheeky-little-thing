// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.battack_32

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

    public dynamic class battack_32 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var stance:thunderJolt3;
        public var self:*;
        public var rand:*;
        public var lvl:int;

        public function battack_32()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8, 8, this.frame9, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.rand = 0;
                this.lvl = 0;
                if (((this.self.isCPU()) && (this.self.getCPUForcedAction() == -1)))
                {
                    this.lvl = this.self.getCPULevel();
                    this.rand = (10 * SSF2API.random());
                    if ((((this.lvl > 5) && (this.rand >= 4)) && (this.rand < 8)))
                    {
                        this.self.importCPUControls([128, 3, 64, 1]);
                        this.self.endAttack();
                    };
                    if (((this.lvl > 5) && (this.rand >= 8)))
                    {
                        this.self.importCPUControls([128, 1, 0, 2, 64, 1]);
                        this.self.endAttack();
                    };
                };
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame8():*
        {
            this.self.fireProjectile("thunderJolt");
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package pikachu_fla

