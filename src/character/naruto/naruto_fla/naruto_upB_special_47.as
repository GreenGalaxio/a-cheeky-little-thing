// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_upB_special_47

package naruto_fla
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

    public dynamic class naruto_upB_special_47 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function naruto_upB_special_47()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 8, this.frame9, 12, this.frame13, 16, this.frame17, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame3():*
        {
            this.self.setYSpeed(-20);
            this.self.setXSpeed(20, false);
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

