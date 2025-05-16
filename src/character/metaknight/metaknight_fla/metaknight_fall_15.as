// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_fall_15

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class metaknight_fall_15 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function metaknight_fall_15()
        {
            addFrameScript(0, this.frame1, 18, this.frame19, 21, this.frame22);
        }

        public function initAPI(_arg_1:*):Class
        {
            return (SSF2API.init(_arg_1));
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame19():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame22():*
        {
            gotoAndPlay("again");
        }


    }
}//package metaknight_fla

