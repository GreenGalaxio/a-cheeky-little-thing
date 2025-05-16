// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_fall_32

package fox_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class fox_fall_32 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function fox_fall_32()
        {
            addFrameScript(0, this.frame1, 3, this.frame4);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            this.gotoAndPlay("redo");
        }


    }
}//package fox_fla

