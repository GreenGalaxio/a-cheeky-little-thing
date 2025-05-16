// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_sweep_special_102

package mario_fla
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

    public dynamic class mario_sweep_special_102 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function mario_sweep_special_102()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 21, this.frame22);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.modifyAttackPower(65);
            this.self.refreshAttackID();
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

