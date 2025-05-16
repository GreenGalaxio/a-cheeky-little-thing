// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.peach_Frozen_121

package peach_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class peach_Frozen_121 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var stance:MovieClip;
        public var self:*;
        public var xframe:String;

        public function peach_Frozen_121()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = "hurt1";
            };
        }


    }
}//package peach_fla

